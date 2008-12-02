require 'rake/rdoctask'

desc 'Run all tests by default'
task :default => :rdoc

desc "Generate documentation for the Rails framework"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = '/tmp/rdoc'
  rdoc.title    = "Test Documentation"
  rdoc.template = './lib/iphone_rdoc_template'
  rdoc.rdoc_files.include('/Users/ted/Desktop/adPickles/github/app/models/*.rb')
end