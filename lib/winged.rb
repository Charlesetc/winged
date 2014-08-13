Dir[File.dirname(__FILE__) + "/winged_*.rb"].each { |file| require file }
Dir[File.dirname(__FILE__) + "/objects/winged_*.rb"].each { |file| require file }


module Winged
	
	@@tree
	
	def self.init
		self.method(:start)
	end
	
	def start(environment)
		[
			200,
			{"Content-Type" => "text/plain"},
			["Hello. The time is #{Time.now}"]
		]
	end
	
	def stack(styles = {})
		
		@@tree.add styles, 'div'
		
		yield if block_given?
		
		@@tree.back
		
	end
	
end


include Winged