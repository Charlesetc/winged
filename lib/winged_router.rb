require_relative './winged'

class WingedRouter
	
	@@paths = {}
	
	def initialize
		yield(self)
	end
	
	def self.route(path)
		if @@paths[path]
			(WINGED_URL + 'app/paths/' + (@@paths[path]) + '.rb')
		else
			nil
		end
	end

	def get(path, action)
		@@paths[path] = action
		# yeild if block_given?
	end

end
