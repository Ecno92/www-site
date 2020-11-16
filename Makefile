PIPENV_RUN := pipenv run
PELICAN := $(PIPENV_RUN) pelican
PELICANOPTS :=
BASEDIR := $(CURDIR)
SCRIPTSDIR := $(BASEDIR)/scripts
INPUTDIR := $(BASEDIR)/content
INPUTOBJECTS := $(shell find $(INPUTDIR) -type d) $(shell find $(INPUTDIR) -type f -name '*')
THEMEDIR := $(BASEDIR)/theme
THEMEOBJECTS := $(shell find $(THEMEDIR) -type d) $(shell find $(THEMEDIR) -type f -name '*')
ASSETS := $(INPUTOBJECTS) $(THEMEOBJECTS) pelicanconf.py publishconf.py
OUTPUTDIR := $(BASEDIR)/output
CONFFILE := $(BASEDIR)/pelicanconf.py
PUBLISHCONF := $(BASEDIR)/publishconf.py
LOCALHOST := 127.0.0.1
DEVPORT := 8000
PREVIEWPORT := 8001
.DEFAULT_GOAL := preview


export PIPENV_VENV_IN_PROJECT := 1
VENV := .venv
$(VENV): Pipfile
	pipenv run python -m pip install 'setuptools==50.3.2'
	pipenv install
	touch $(VENV)

venv: $(VENV)

init: $(VENV)
	(ls theme/ > /dev/null && cd theme/ && git pull) || git clone https://github.com/Ecno92/pelican-hyde.git theme/

devserver-start: $(init)
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh restart $(DEVPORT)

devserver-stop: $(init)
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh stop

publish: $(init) $(ASSETS)
	$(info 'Cleaning output dir...')
	@[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)
	$(info 'Publishing content with Pelican...')
	@$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

preview: publish
	(sleep 2 && firefox --new-tab http://$(LOCALHOST):$(PREVIEWPORT)) & \
	cd output && $(PIPENV_RUN) python -m http.server --bind $(LOCALHOST) $(PREVIEWPORT)

# https://github.com/getpelican/pelican/wiki/Tips-n-Tricks#make-newpost
PAGESDIR=$(INPUTDIR)/blog
DATE := $(shell date +'%Y-%m-%d %H:%M:%S')
SLUG := $(shell echo '${NAME}' | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT := md
newpost:
ifdef NAME
	echo "Title: $(NAME)"	> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "Slug: $(SLUG)"	>> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "Date: $(DATE)"	>> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "Description:"		>> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "" 							>> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "" 							>> $(PAGESDIR)/$(SLUG).$(EXT)
	${EDITOR} ${PAGESDIR}/${SLUG}.${EXT} &
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make newpost NAME='"'"'Post Name'"'"
endif

.PHONY: venv \
	devserver-start	\
	devserver-stop \
	publish	\
	preview \
	newpost
