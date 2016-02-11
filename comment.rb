class Comment

  def initialize(id, comment, username, time_or_date_posted)
    @id = id
    @comment = comment
    @username = username
    @time_or_date_posted = time_or_date_posted
  end

  def has_subcomments?
    #checks if subcomments exist in comment
  end

  def show_subcomments
    #print out subcomment if it has subcomments
  end

end