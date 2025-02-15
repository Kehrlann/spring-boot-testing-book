.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

html:
	asciidoctor --destination-dir html/ chapters/*.adoc

.PHONY: server
serve:
	npx http-server html/
