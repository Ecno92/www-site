# Workaround for issues in Netlify which started to occur
# recently
POETRY := poetry --no-plugins
THEME_REPO := https://github.com/jvanz/pelican-hyde.git

theme:
	(ls theme/ > /dev/null && cd theme/ && git pull) || git clone $(THEME_REPO) theme/

dev:
	$(POETRY) run pelican --listen --autoreload

publish:
	$(POETRY) run pelican

venv:
	$(POETRY) env use $(shell which python3)
	$(POETRY) install

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

.PHONY: theme \
	dev \
	publish	\
	deploy \
	newpost
