#\-s puma

require './lib/winged.rb'

builder = Rack::Builder.new do
  use Rack::Logger
	run Winged.init
end

run builder
