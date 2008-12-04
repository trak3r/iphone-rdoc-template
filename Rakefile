require 'rake/rdoctask'

# TODO: set up vars for paths to rails distro

namespace :pocketrails do
  desc "Generate the RDoc for Rails"
  task :rdoc do
    system "cd ~/Desktop/rails && rake rerdoc template=~/Desktop/iphone_rdoc_template/lib/iphone_rdoc_template"
  end

  desc "Upload the RDoc to DreamHost"
  task :scp do
    system "cd ~/Desktop/rails && scp -r * teflonted@pocketrails.com:pocketrails.com/"
  end
end

desc "Build and deploy"
task :deploy => [ 'pocketrails:rdoc', 'pocketrails:scp' ] do
end

desc 'Run all tests by default'
task :default => :rdoc
