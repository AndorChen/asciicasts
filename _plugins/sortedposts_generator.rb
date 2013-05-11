module Jekyll
  class SortedPostsGenerator < Generator

    safe true

    def generate(site)
      site.config['sorted_posts'] = site.posts.sort { |x, y| y.data['episode'] <=> x.data['episode'] }
    end

  end
end
