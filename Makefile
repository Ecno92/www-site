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
.DEFAULT_GOAL := usage


export PIPENV_VENV_IN_PROJECT := 1
.venv/x: Pipfile
	pipenv install --dev
	touch .venv/x

usage:
	@echo 'Use the following make command combinations to interact with the project in a quick way';
	@echo '---------------------------------------------------------------------------------------';
	@echo 'devserver-start and devserver-stop:  Start and stop the devserver'
	@echo 'publish and preview: Render the site and preview the site in the webbrowser'
	@echo 'deploy: Deploy the rendered site using sftp.'
	@echo "newpost NAME='Name of the post': Write a new blog post"

theme/pelican-hyde/*:
	test ! -z 'ls theme/pelican-hyde' && \
		git submodule update --init --recursive theme/pelican-hyde

init := .venv/x theme/pelican-hyde/*

devserver-start: $(init)
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh restart $(DEVPORT)

devserver-stop: $(init)
	$(PIPENV_RUN) $(SCRIPTSDIR)/develop_server.sh stop

$(OUTPUTDIR): $(init) $(ASSETS)
	$(info 'Cleaning output dir...')
	@[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)
	$(info 'Publishing content with Pelican...')
	@$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

publish: $(OUTPUTDIR)

preview: publish
	(sleep 2 && firefox --new-tab http://$(LOCALHOST):$(PREVIEWPORT)) & \
	cd output && $(PIPENV_RUN) python -m http.server --bind $(LOCALHOST) $(PREVIEWPORT)

deploy: $(OUTPUTDIR)
	OUTPUTDIR=$(OUTPUTDIR) ./scripts/deploy_ftp.sh

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

.PHONY:
	usage						\
	devserver-start	\
	devserver-stop 	\
	publish					\
	deploy					\
	newpost
