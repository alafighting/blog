module Jekyll
  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      process(@name)
      read_yaml(File.join(base, 'template'), 'category.html')
      data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      dir = site.config['category_dir'] || 'categories'
      site.categories.each_key do |category|
        site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
      end
    end
  end
end
