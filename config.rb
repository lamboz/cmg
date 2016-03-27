###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration
activate :i18n, :mount_at_root => :es
activate :sprockets

activate :relative_assets
set :relative_links, true

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
  sprockets.append_path File.join "#{root}", @bower_config["directory"], 'foundation-sites/scss'
  sprockets.append_path File.join "#{root}", @bower_config["directory"], 'jquery'
  sprockets.append_path File.join "#{root}", @bower_config["directory"], 'font-awesome/scss'
end



#set :images_dir, 'fonts'
#sprockets.import_asset('font-awesome/fonts/FontAwesome.otf') {|p| "#{images_dir}/FontAwesome.otf"}
