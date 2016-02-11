require 'open-uri'
require 'nokogiri'
require_relative 'post'
require_relative 'comment'

if ARGV[0][/news.ycombinator.com/]

  url = ARGV[0]

  html_file = open(url)

  #method will not work if it's outside scope of if statement, can I extrapolate somehow?
  def extract_id(dom)
    href_with_id = dom.search('.subtext .age a').map { |link| link['href']}.join
    href_with_id[/\d+/].to_i
  end
  
  #Parsing Post instance parameters
  dom = Nokogiri::HTML(html_file)
  title = dom.css('title').text
  points = dom.search('.subtext > span:first-child').map do |span|
    span.inner_text
  end
  item_id = extract_id(dom)

  #Create new instance of Post
  post = Post.new(title, url, points, item_id)

  #Parsing Comments instance parameters

  array_of_usernames = dom.search('.comhead > a:first-child').map do |username|
    username.inner_text
  end

  array_of_dates_or_times = dom.search('.comhead .age > a:first-child').map do |dateortime|
    dateortime.inner_text
  end

  array_of_ids = dom.search('.comhead .age a:first-child').map do |link|
    link['href'][/\d+/].to_i
  end

  array_of_comments = dom.search('.comment .c00').map do |comment|
    comment.inner_text
  end

  num_for_loop = array_of_comments.size

  (0..num_for_loop).each do |n|
    comment_object = Comment.new(array_of_ids[n], array_of_comments[n], array_of_usernames[n], array_of_dates_or_times[n])
    post.add_comment(comment_object)
  end
  


  # Shows various stats of post
  puts "Title: #{post.title}"
  puts "ID: #{post.item_id}"
  puts post.points
  puts "Number of comments: #{num_for_loop}"
  puts "Latest comment: #{post.comments[0].comment}"
  puts "Time posted: #{post.comments[0].time_or_date_posted}"


end



