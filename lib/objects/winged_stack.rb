
module Winged
	
	def stack(styles = {})
		
		stack = @@tree.add styles, 'div'
		
		stack.add_class 'winged_stack'
		
		yield if block_given?
		
		@@tree.back
		
	end

end