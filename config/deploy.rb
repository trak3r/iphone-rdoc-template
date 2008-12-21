role :site, 'pocketrails.com'
role :local, 'localhost'

DESKTOP_PATH = "/Users/ted/Desktop"
PROJECT_PATH = "#{DESKTOP_PATH}/iPhone/personal projects/pocketrails/iphone-rdoc-template"
RAILS_PATH = "#{PROJECT_PATH}/../rails"
RDOC_PATH = "#{RAILS_PATH}/doc/rdoc"
REMOTE_PATH = "~/pocketrails.com"
ZIPPED_FILE = "pocketrails.tgz"

desc "Compress the files locally."
task :gzip, :roles => :local do
  run "cd '#{RDOC_PATH}' && tar cvzf '#{ZIPPED_FILE}' *"
end

desc "Copy the zip file to the server."
task :scp, :roles => :site do
  upload "#{RDOC_PATH}/#{ZIPPED_FILE}", "#{REMOTE_PATH}", :via => :scp
end

desc "Decompress the file remotely."
task :gunzip, :roles => :site do
  run "cd #{REMOTE_PATH} && tar xvzf #{ZIPPED_FILE}"
end

desc "Regenerate the sitemap XML."
task :sitemap, :roles => :site do
  run "cd sitemap_gen && ./sitemap_gen.py --config=config.xml"
end

task :deploy do
  gzip
  scp
  gunzip
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
