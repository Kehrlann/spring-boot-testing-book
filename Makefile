.DELETE_ON_ERROR:
.ONESHELL:
.SHELLFLAGS = -c
MAKEFLAGS += --silent

.PHONY: remove-blank-lines
remove-blank-lines: manuscript/*.adoc
	./resources/remove_blank_line.awk $^

.PHONY: cleanup-code
cleanup-code:
	set -e
	cd code/

	# use jdk 25
	source "$$HOME/.sdkman/bin/sdkman-init.sh"
	sdk use java 25-tem

	# Ensure main is clean
	git switch main
	if [[ -n "$$(git status --untracked-files=yes --porcelain)" ]]; then
		echo "Uncommitted changes in main"
		exit 1
	fi

	# Check test and formatting
	#./scripts/run-all-tests.sh

	# Update all code samples
	git switch asciidoc
	git rebase main
	find . -name "*.java" -type f -exec sed -i '' '/\/\/@formatter:/d' {} \;
	#find . -name "*.java" -type f -exec sed -i '' '/\/\/ tag::/d' {} \;
	#find . -name "*.java" -type f -exec sed -i '' '/\/\/ end::/d' {} \;
	find . -name "*.java" -type f -exec sed -i '' 's/\/\/ \(<[0-9]*>\)/\1/g' {} \;

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
