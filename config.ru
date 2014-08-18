
require './lib/winged.rb'


# Only serves public files, not folders.

builder = Rack::Builder.new do
  use Rack::Logger
	# Dir['./app/public/*.*'].each do |file|
	# 	map "/#{File.basename file}" do
	# 		run Rack::File.new(file)
	# 	end
	# end
	run Winged.init
	map '/public' do
		use Rack::Static, urls: [''], root: 'app/public'
	end
end

run builder
