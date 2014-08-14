
require_relative './environment'
require_relative '../app/route'

module Winged
	
	@@tree
	
	def self.init
		self.method(:start)
	end
	
	# Make your own static files server.
	
	def start(env)
		request = Rack::Request.new(env)
		
		@route = WingedRouter.route(env['PATH_INFO'])
		if @route
			[
				200,
				{"Content-Type" => "text/html"},
				[render(@route)]
			]
		else
			[
				404,
				{"Content-Type" => "text/plain"},
				["404 ERROR"]
			]
		end
	end
	
	def stack(styles = {})
		
		@@tree.add styles, 'div'
		
		yield if block_given?
		
		@@tree.back
		
	end
	
	def render(route)
		require_relative route
		w = WingedBuilder.new @@tree.root
		
		return w.to_html
	end
	
	
end


include Winged