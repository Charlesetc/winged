
require_relative './environment'
load 'app/route.rb' # Might not work

module Winged
	
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
				{"Content-Type" => "text/html"},
				["<html>
	<head><title>404</title><style>body{text-align:center;padding:60px}</style></head>
	<body><h1>404 Error</h1><p>Page not found.</p></body>
</html>"]
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