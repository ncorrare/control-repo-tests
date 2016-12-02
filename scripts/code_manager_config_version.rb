require 'json'
require 'rugged'

environmentpath = ARGV[0]
environment     = ARGV[1]

r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

sha = JSON.parse(File.read(r10k_deploy_file_path))['signature']

repo = Rugged::Repository.new('https://github.com/ncorrare/control-repo-tests.git')
tag  = repo.lookup(sha)
str  = tag.name
if str.nil?
	output = "#{environment}/#{sha}"
else
	
	output = "#{environment}/#{str}"
end
#output the sha1 from the control-repo
puts output
