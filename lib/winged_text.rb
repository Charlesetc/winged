
require_relative 'winged_object'

class WingedText < WingedObject
	
	def initialize(text, styles =  {})
		@text = text
		@children = []
		@classes = []
		@styles = styles
		@attributes = {}
		@tag = 'span'
	end
	
	def textify(node)
		node.content = @text
	end
	
end