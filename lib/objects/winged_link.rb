
module Winged
	def link(text, input = {})

		styles = input

		# Get href from input
		if styles.has_key?(:href)
			@href = styles.delete(:href)
		end

		# Make element
		link = @@tree.add_text text, styles, 'a'

		# Make href an attribute
		if @href
			link[:href] = @href
		end

		yield if block_given?

		@@tree.back

	end
end


# module Winged
#
# 	module WingedLink
#
# 		def link(styles = {})
#
# 			@@tree.add styles, 'div'
#
# 			yield if block_given?
#
# 			@@tree.back
#
# 		end
#
# 	end
# end