require 'json'

environmentpath = ARGV[0]
environment     = ARGV[1]

r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

sha = JSON.parse(File.read(r10k_deploy_file_path))['signature']

str  = `git ls-remote --tags https://github.com/ncorrare/control-repo-tests | grep 5e383672601b262e5aef4f01845297dbc5915a03 |awk -F/ '{print $3}'`
tag = str.delete!("\n")
if str.nil?
		output = "#{environment}/#{sha}"
else

		output = "#{environment}/#{tag}"
end
#output the sha1 from the control-repo
puts output
