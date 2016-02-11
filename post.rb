class Post
  attr_reader :title, :points, :item_id, :comments
  
  def initialize(title, url, points, item_id)
    @title = title
    @points = points
    @item_id = item_id #look for value="item?id=239847293" when inspecting element
    @comments = []
  end

  def parse_comments(dom)
    @comments = dom.search('.comment > span:first-child').map do |span|
      span.inner_text
    end
  end

  def add_comment(comment_object)
    #add comments to Comment instance
  end

  def self.parse_from_url(url)
    dom = Nokogiri::HTML(File.open(url))

    title = dom.css('title').text
    points = dom.search('.subtext > span:first-child').map do |span|
      span.inner_text
    end

    item_id = extract_id(dom)

    post = self.new(title, url, points, item_id)
    post.parse_comments(dom)
    post
  end

private

  def self.extract_id(dom)
    #Extracts ID from website and turns it into an int
    href_with_id = dom.search('.subtext .age a').map { |link| link['href']}.join
    href_with_id[/\d+/].to_i #do I want it as an int or a String?
  end
  
end
