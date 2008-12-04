role :site, 'pocketrails.com'

set :user, 'teflonted'

namespace :pr do
  desc "Generate the RDoc."
  task :rdoc do
  end
  
  desc "Compress the files locally."
  task :gzip do
  end
  
  desc "Copy the zip file to the server."
  task :scp, :roles => :site do
    upload "rdoc", "~", :via => :scp
  end

  desc "Decompress the file remotely."
  task :gunzip do
    run "cd ~/pocketrails.com && gunzip ~/rdoc"
  end
end

task :deploy do
end

before 'pr:gzip', 'pr:rdoc'
before 'pr:scp', 'pr:gzip'
before 'pr:gunzip', 'pr:scp'  
before 'deploy', 'pr:gunzip'