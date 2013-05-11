# the title is the slug of the origin RailsCasts episode
desc 'Create new post'
task :post, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter a title for your post:")
  end

  episode = title.split('-').first

  filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title}.md"
  if File.exist?(filename)
    abort("rake aborted!") if ask("#{filename} already exists. Do you want to overwrite?", ['y', 'n']) == 'n'
  end
  puts "Creating new post: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: episode"
    post.puts "title: "
    post.puts "date: #{Time.now.strftime('%Y-%m-%d %H:%M')}"
    post.puts "episode: #{episode}"
    post.puts "railscasts_url: http://railscasts.com/episodes/#{title}"
    post.puts "---"
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
