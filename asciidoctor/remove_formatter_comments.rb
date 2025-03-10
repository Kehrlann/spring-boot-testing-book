require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'

include Asciidoctor

# Remove //@formatter:off and //@formatter:on comments from java source.
class RemoveFormatter < Asciidoctor::Extensions::TreeProcessor
  include Asciidoctor::Logging

  def process(document)
    document.find_by(context: :listing) do |block|
      if block.attributes["style"] == "source" && block.attributes["language"] == "java"
        block.lines = block.lines.reject { |l| l.include? "@formatter:" }
      end
    end
    document
  end
end

Extensions.register do
  treeprocessor RemoveFormatter
end