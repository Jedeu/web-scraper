require 'nokogiri'  

doc = Nokogiri::HTML(File.open('post.html'))

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    puts element.inner_text
  end
end

# puts extract_usernames(doc)

def extract_title(doc)
  doc.css('title').text
end

def extract_points(doc)
  doc.search('.subtext > span:first-child').map do |span|
    span.inner_text
  end
end

def extract_id(doc)
  #Extracts ID from website and turns it into an int
  href_with_id = doc.search('.subtext .age a').map { |link| link['href']}.join
  href_with_id[/\d+/].to_i #do I want it as an int or a String?
end


puts extract_url(doc)