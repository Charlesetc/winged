require_relative 'winged'

class WingedTree
	
	def initialize(styles = {})
		
		styles # use styles to set main things like title
		
		@root = @current = WingedObject.new()
		@root.parent = @root
	end
	
	def add(styles = {}, tag = nil)
		@new = WingedObject.new(styles)
		if tag
			@new.tag tag
		end
		@current << @new
		@current = @new
	end
	
	def add_text(text, styles = {}, tag = nil)
		@new = WingedText.new(text, styles)
		if tag
			@new.tag tag
		end
		@current << @new
		@current = @new
	end
	
	def root
		@root
	end
	
	def current
		@current
	end
	
	def back
		@current = @current.parent
	end
	
end