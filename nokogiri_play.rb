require 'nokogiri'

doc = Nokogiri::HTML(File.open('post.html'))

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    puts element.inner_text
  end
end

puts extract_usernames(doc)