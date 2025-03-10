.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

html: chapters/*.adoc
	asciidoctor \
	    --destination-dir html/ \
	    --require ./asciidoctor/remove_formatter_comments.rb --trace \
	    chapters/*.adoc

.PHONY: watch
watch:
	ls chapters/*.adoc | entr $(MAKE) html


.PHONY: server
serve:
	npx http-server html/
