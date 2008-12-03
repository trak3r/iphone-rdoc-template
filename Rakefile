require 'rake/rdoctask'

# TODO: set up vars for paths to rails distro

# TODO: task to deploy to dreamhost
# teflon-ted:~/Desktop/rails/doc/rdoc ted$ scp -r * teflonted@terranova.dreamhost.com:pocketrails.com/

# TODO: task to regenerate Rails documentation
# teflon-ted:~/Desktop/rails ted$ rake rerdoc template=~/Desktop/iphone_rdoc_template/lib/iphone_rdoc_template

desc 'Run all tests by default'
task :default => :rdoc

desc "Generate documentation for the Rails framework"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = '/tmp/rdoc'
  rdoc.title    = "Test Documentation"
  rdoc.template = './lib/iphone_rdoc_template'
  rdoc.rdoc_files.include('/Users/ted/Desktop/rails/activerecord/lib/**/*.rb')
end