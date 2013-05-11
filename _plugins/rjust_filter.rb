module Jekyll
  module RjustFilter
    def rjust(input, num, str)
      input.to_s.rjust(num, str)
    end
  end
end

Liquid::Template.register_filter(Jekyll::RjustFilter)
