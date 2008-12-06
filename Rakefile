require 'echoe'
require 'rake/rdoctask'

Echoe.new('iphone_rdoc_template') do |gem|
  gem.version = '0.0.1'
  gem.summary = 'An RDoc template to look good in the iPhone web browser'
  gem.description = gem.summary
  gem.author = "Thomas 'Ted' Davis"
  gem.email = 'ted@pocketrails.com'
  gem.url = 'https://github.com/trak3r/iphone-rdoc-template'
end

RAILS_PATH = '~/Desktop/rails'
TEMPLATE_PATH = '~/Desktop/pocketrails/lib/iphone_rdoc_template'

desc "Generate the RDoc for Rails"
task :rerdoc do
  system "cd #{RAILS_PATH} && rake rerdoc template=#{TEMPLATE_PATH}"
end

desc 'Run all tests by default'
task :default => :rerdoc