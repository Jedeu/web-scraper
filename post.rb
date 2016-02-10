class Post

  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
  end

  def comments
    #returns comments with associated post
  end

  def add_comment(comment_object_from_comment_class)
    #adds to comment list
  end
  
end
