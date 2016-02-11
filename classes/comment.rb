class Comment
  attr_reader :id, :comment, :username, :time_or_date_posted

  def initialize(id, comment, username, time_or_date_posted)
    @id = id
    @comment = comment
    @username = username
    @time_or_date_posted = time_or_date_posted
  end
end
