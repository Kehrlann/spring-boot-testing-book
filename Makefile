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

# Pattern rule: each PDF depends on its corresponding .adoc file
pdf/%.pdf: manuscript/%.adoc
	@mkdir -p pdf/
	./resources/remove_blank_line.awk $<
	asciidoctor-pdf \
	    --destination-dir pdf/ \
	    --attribute pdf-theme=manning \
	    --require asciidoctor-mathematical \
	    --require ./resources/remove_formatter_comments.rb \
	    --require ./resources/sectnumoffset-treeprocessor.rb \
	    --trace \
	    $<

# Get list of all .adoc files
ADOC_FILES := $(wildcard manuscript/*.adoc)
# Convert to PDF targets
PDF_FILES := $(patsubst manuscript/%.adoc,pdf/%.pdf,$(ADOC_FILES))

# Main pdf target: depends on all PDF files (each handles its own preprocessing)
pdf: $(PDF_FILES)
