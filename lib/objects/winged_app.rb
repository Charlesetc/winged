
module Winged
	
	def app(styles = {})
		
		@@tree = WingedTree.new(styles)
		
		yield
		
		@@tree.back
		
		@@tree.root
		
	end
	
end