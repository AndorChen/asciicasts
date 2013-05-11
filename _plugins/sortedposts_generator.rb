module Jekyll
  class SortedPostsGenerator < Generator

    safe true

    def generate(site)
      site.config['sorted_posts'] = site.posts.sort { |x, y| x.data['episode'] <=> y.data['episode'] }
    end

  end
end
