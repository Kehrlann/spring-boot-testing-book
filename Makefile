.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

html: chapters/*.adoc
	asciidoctor --destination-dir html/ chapters/*.adoc

.PHONY: watch
watch:
	ls chapters/*.adoc | entr $(MAKE) html


.PHONY: server
serve:
	npx http-server html/
