.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

html: chapters/*.adoc
	asciidoctor --destination-dir html/ chapters/*.adoc

.PHONY: server
serve:
	npx http-server html/
