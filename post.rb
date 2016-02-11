class Post
  attr_reader :title, :points, :item_id
  attr_accessor :comments, :url
  
  def initialize(title, url, points, item_id)
    @title = title
    @points = points
    @item_id = item_id
    @comments = []
  end

  def add_comment(comment_object)
    @comments << comment_object
  end
  
end
