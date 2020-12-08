PIPENV_RUN := pipenv run
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
DEVPORT := 8000

export PIPENV_VENV_IN_PROJECT := 1
venv:
	pipenv run python -m pip install 'setuptools==50.3.2'
	pipenv install

theme:
	(ls theme/ > /dev/null && cd theme/ && git pull) || git clone https://github.com/Ecno92/pelican-hyde.git theme/

devserver-start:
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh restart $(DEVPORT)

devserver-stop:
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh stop

preview:
	firefox --new-tab file://$(OUTPUTDIR)/index.html

publish:
	$(info 'Cleaning output dir...')
	@[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)
	$(info 'Publishing content with Pelican...')
	@pelican $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

deploy: theme publish

# https://github.com/getpelican/pelican/wiki/Tips-n-Tricks#make-newpost
PAGESDIR=$(INPUTDIR)/articles
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
	theme \
	devserver-start	\
	devserver-stop \
	preview \
	publish	\
	deploy \
	newpost
