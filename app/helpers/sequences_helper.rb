require 'nokogiri'

module SequencesHelper

  ROOT_TRANS = '/output.xslt'

  def client(data, transform: ROOT_TRANS)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(
      doc, 'xml-stylesheet', "type=\"text/xsl\" href=\"#{transform}\""
    )
    doc.root.add_previous_sibling(xslt)
    doc
  end

  def server(data)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read('public/output.xslt'))
    xslt.transform(doc)
  end
end
