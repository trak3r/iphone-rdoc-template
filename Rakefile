require 'rake/rdoctask'

RAILS_PATH = '~/Desktop/rails'
TEMPLATE_PATH = '~/Desktop/iphone_rdoc_template/lib/iphone_rdoc_template'

desc "Generate the RDoc for Rails"
task :rerdoc do
  system "cd #{RAILS_PATH} && rake rerdoc template=#{TEMPLATE_PATH}"
end

desc 'Run all tests by default'
task :default => :rerdoc