# Workaround for issues in Netlify which started to occur
# recently
THEME_REPO := https://github.com/jvanz/pelican-hyde.git
VENV_BIN := ./.venv/bin


theme:
	(ls theme/ > /dev/null && cd theme/ && git pull) || git clone $(THEME_REPO) theme/

dev:
	$(VENV_BIN)/pelican --listen --autoreload

publish:
	$(VENV_BIN)/pelican

venv:
	python3 -m venv .venv/
	.venv/bin/pip install -r requirements.txt

deploy: venv theme publish

# https://github.com/getpelican/pelican/wiki/Tips-n-Tricks#make-newpost
PAGESDIR=content/articles
DATE := $(shell date +'%Y-%m-%d %H:%M:%S')
SLUG := $(shell echo '${NAME}' | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT := md
newpost:
ifdef NAME
	@echo "Title: $(NAME)"	> $(PAGESDIR)/$(SLUG).$(EXT)
	@echo "Slug: $(SLUG)"	>> $(PAGESDIR)/$(SLUG).$(EXT)
	@echo "Date: $(DATE)"	>> $(PAGESDIR)/$(SLUG).$(EXT)
	@echo "Description:"		>> $(PAGESDIR)/$(SLUG).$(EXT)
	@echo "" 							>> $(PAGESDIR)/$(SLUG).$(EXT)
	@echo "" 							>> $(PAGESDIR)/$(SLUG).$(EXT)

	@echo File available at ${PAGESDIR}/${SLUG}.${EXT}
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make newpost NAME='"'"'Post Name'"'"
endif

dependencies:
	uv pip freeze > requirements.txt

.PHONY: theme \
	dev \
	publish	\
	deploy \
	newpost \
	dependencies
