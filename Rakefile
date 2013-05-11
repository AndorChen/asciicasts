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

desc 'Serve the site up'
task :server do
  system 'bundle exec jekyll server --watch'
end

desc 'Push to github'
task :push, :msg do |t, args|
  if args.msg
    msg = args.msg
  else
    msg = get_stdin("Enter commit message:")
  end

  puts   "Pushing to `source' branch:"
  system "git add -A"
  system "git commit -m '#{msg}'"
  system "git push origin source"
  puts   "\t`source' branch updated.\n"

  puts   "Building site...."
  system "bundle exec jekyll build"
  puts   "\tSite updated.\n"

  cd '_site' do
    puts   "Pushing to gh-pages branch:"
    system "git add -A"
    system "git commit -m 'update at #{Time.now.utc}'"
    system "git push origin gh-pages"
    puts   "\t`gh-pages' branch updated."
  end
end

def get_stdin(message)
  print message
  STDIN.gets.chomp
end
