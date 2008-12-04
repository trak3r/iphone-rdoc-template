role :site, 'pocketrails.com'
role :local, 'localhost'

desktop_path = "/Users/ted/Desktop"
rails_path = "#{desktop_path}/rails"
rdoc_path = "#{rails_path}/doc/rdoc"
project_path = "#{desktop_path}/iphone_rdoc_template"
remote_path = "~/pocketrails.com"
zipped_file = "pocketrails.tgz"

desc "Generate the RDoc."
task :rdoc, :roles => :local do
  run "cd #{rails_path} && rake rerdoc template=#{project_path}/lib/iphone_rdoc_template"
end

desc "Compress the files locally."
task :gzip, :roles => :local do
  run "cd #{rdoc_path} && tar --create --gzip --file #{zipped_file} *"
end

desc "Copy the zip file to the server."
task :scp, :roles => :site do
  upload "#{rdoc_path}/#{zipped_file}", "#{remote_path}", :via => :scp
end

desc "Decompress the file remotely."
task :gunzip, :roles => :site do
  run "cd #{remote_path} && tar xvzf #{zipped_file}"
end

task :deploy do
  rdoc
  gzip
  scp
  gunzip
end

[ 'rdoc', 'gzip' ].each do |task| 
  before "#{task}" do 
    set :user, 'ted'
  end 
end

[ 'scp', 'gunzip' ].each do |task| 
  before "#{task}" do 
    set :user, 'teflonted'
  end 
end
