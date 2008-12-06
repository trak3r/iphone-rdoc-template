role :site, 'pocketrails.com'
role :local, 'localhost'

desktop_path = "/Users/ted/Desktop"
rails_path = "#{desktop_path}/rails"
rdoc_path = "#{rails_path}/doc/rdoc"
remote_path = "~/pocketrails.com"
zipped_file = "pocketrails.tgz"

desc "Compress the files locally."
task :gzip, :roles => :local do
  run "cd #{rdoc_path} && tar cvzf #{zipped_file} *"
end

desc "Copy the zip file to the server."
task :scp, :roles => :site do
  upload "#{rdoc_path}/#{zipped_file}", "#{remote_path}", :via => :scp
end

desc "Decompress the file remotely."
task :gunzip, :roles => :site do
  run "cd #{remote_path} && tar xvzf #{zipped_file}"
end

desc "Regenerate the sitemap XML."
task :sitemap, :roles => :site do
  run "cd sitemap_gen && ./sitemap_gen.py --config=config.xml"
end

task :deploy do
  gzip
  scp
  gunzip
  sitemap
end

[ 'gzip' ].each do |task| 
  before "#{task}" do 
    set :user, 'ted'
  end 
end

[ 'scp', 'gunzip', 'sitemap' ].each do |task| 
  before "#{task}" do 
    set :user, 'teflonted'
  end 
end
