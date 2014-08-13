require_relative './winged'

module WingedRouter
	
	@@paths = {}
	
	def get(path, action)
		@@paths[path] = action
		# yeild if block_given?
	end
	
	# def post(path, action)
	# 	# yeild if block_given?
	# end
	
	def route(path)
		(@@paths[path] + '.rb')
	end
	
end