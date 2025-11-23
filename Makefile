.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

.PHONY: remove-blank-lines
remove-blank-lines: manuscript/*.adoc
	./resources/remove_blank_line.awk $^

html: manuscript/*.adoc
	asciidoctor \
	    --destination-dir html/ \
	    --require ./resources/remove_formatter_comments.rb \
	    --require ./resources/sectnumoffset-treeprocessor.rb \
	    --trace \
	    $^

pdf: manuscript/*.adoc
	$(MAKE) remove-blank-lines
	asciidoctor-pdf \
	    --destination-dir pdf/ \
	    --attribute pdf-theme=manning \
	    --require asciidoctor-mathematical \
	    --require ./resources/remove_formatter_comments.rb \
	    --require ./resources/sectnumoffset-treeprocessor.rb \
	    --trace \
	    $^
