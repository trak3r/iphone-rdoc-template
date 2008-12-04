role :site, 'pocketrails.com'
role :local, 'localhost'

namespace :pr do
  desc "Generate the RDoc."
  task :rdoc, :roles => :local do
    run "cd ~/Desktop/rails && rake rerdoc template=~/Desktop/iphone_rdoc_template/lib/iphone_rdoc_template"
  end
  
  desc "Compress the files locally."
  task :gzip, :roles => :local do
    run "cd ~/Desktop/rails/doc/rdoc && gzip --stdout --recursive * > rdoc.gz"
  end
  
  desc "Copy the zip file to the server."
  task :scp, :roles => :site do
    upload "rdoc", "~", :via => :scp
  end

  desc "Decompress the file remotely."
  task :gunzip, :roles => :site do
    run "cd ~/pocketrails.com && gunzip ~/rdoc.gz"
  end
end

task :deploy do
end

#before 'pr:gzip', 'pr:rdoc'
#before 'pr:scp', 'pr:gzip'
#before 'pr:gunzip', 'pr:scp'  
#before 'deploy', 'pr:gunzip'

[ 'pr:rdoc', 'pr:gzip' ].each do |task| 
  before "#{task}" do 
    set :user, 'ted'
  end 
end

[ 'pr:scp', 'pr:gunzip' ].each do |task| 
  before "#{task}" do 
    set :user, 'teflonted'
  end 
end
