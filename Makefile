.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

html: manuscript/*.adoc
	asciidoctor \
	    --destination-dir html/ \
	    --require ./resources/remove_formatter_comments.rb \
	    --require ./resources/sectnumoffset-treeprocessor.rb \
	    --trace \
	    $^

pdf: manuscript/*.adoc
	asciidoctor-pdf \
	    --destination-dir pdf/ \
	    --attribute pdf-theme=manning \
	    --require asciidoctor-mathematical \
	    --require ./resources/remove_formatter_comments.rb \
	    --require ./resources/sectnumoffset-treeprocessor.rb \
	    --trace \
	    $^
