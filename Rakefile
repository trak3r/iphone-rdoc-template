require 'echoe'
require 'rake/rdoctask'

task :test => :rerdoc

Echoe.new('iphone_rdoc_template') do |gem|
  gem.version = '0.0.1'
  gem.summary = 'An RDoc template to look good in the iPhone web browser'
  gem.description = gem.summary
  gem.author = "Thomas 'Ted' Davis"
  gem.email = 'ted@pocketrails.com'
  gem.url = 'https://github.com/trak3r/iphone-rdoc-template'
end

PROJECT_PATH = '/Users/ted/Desktop/iPhone/personal\ projects/pocketrails'
RAILS_PATH = "#{PROJECT_PATH}/rails"
TEMPLATE_PATH = "#{PROJECT_PATH}/lib/iphone_rdoc_template"
IUI_PATH = "#{PROJECT_PATH}/iui-0.13"
RDOC_PATH = "#{RAILS_PATH}/doc/rdoc"

desc "Copy the image files referenced by the templates"
task :copy_images do
  [ 'listArrow.png', 'pinstripes.png' ].each do |image|
    system "cp #{IUI_PATH}/iui/#{image} #{RDOC_PATH}/#{image}"
  end
end

desc "Generate the RDoc for Rails"
task :rerdoc do
  system "cd #{RAILS_PATH} && rake rerdoc template=#{TEMPLATE_PATH}"
  Rake::Task[ "copy_images" ].execute
end
