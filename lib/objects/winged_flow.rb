module Winged
	
	def flow(styles = {})
		
		flow = @@tree.add styles, 'div'
		
		flow.add_class 'winged_flow'
		
		yield if block_given?
		
		@@tree.back
		
	end

end