require 'rake/rdoctask'

# TODO: set up vars for paths to rails distro

desc "Generate the RDoc for Rails"
task :generate do
  system "cd ~/Desktop/rails && rake rerdoc template=~/Desktop/iphone_rdoc_template/lib/iphone_rdoc_template"
end

desc "Upload the RDoc to DreamHost"
task :deploy do
  system "cd ~/Desktop/rails && scp -r * teflonted@terranova.dreamhost.com:pocketrails.com/"
end

desc 'Run all tests by default'
task :default => :generate
