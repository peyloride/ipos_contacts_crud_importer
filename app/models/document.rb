class Document < ActiveRecord::Base
  belongs_to :contact
  has_attached_file :gpx

  before_save :parse_file

  def parse_file
    tempfile = gpx.queued_for_write[:original]
    doc = Nokogiri::XML(tempfile)
    parse_xml(doc)
  end

  def parse_xml(doc)
    doc.css('contact').each do |node|
      Contact.create do |contact|
        contact.name = node.css("name").first.text
        contact.lastName = node.css("lastName").first.text
        contact.phone = node.css("phone").first.text
      end
    end
  end
end
