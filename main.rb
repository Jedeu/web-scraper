require 'nokogiri'
require_relative 'post'
# require 'comment'

if ARGV[0] == "post.html"
  
  post = Post.parse_from_url('post.html')

   #Shows various stats of post
  puts "Title: #{post.title}"
  puts "ID: #{post.item_id}"
  puts post.points
  puts "Number of comments: #{post.comments.size}"

end

