# encoding: utf-8
class BookFormatter

  attr_accessor :title, :content

  def initialize(title, content)
    self.title = title
    self.content = content
  end

  def formatted_title
    title.gsub('.',' ')
  end

  def book_file_name(root)
    "#{root}/tmp/#{title.gsub(/( |\.)/,'_')}/#{formatted_title}.html"
  end

  def formatted_book
    "<html><head><title>#{title}</title></head><body>#{fixed_encoding_content}</body></html>"
  end

  private

  def fixed_encoding_content
    content.gsub(/(’|’)/,"'")
      .gsub(/(“|”)/,'"')
      .gsub(/ /,' ')
      .encode('ISO-8859-1', {:invalid => :replace, :undef => :replace, :replace => '?'})
  end

end
