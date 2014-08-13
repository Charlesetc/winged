require_relative '../lib/winged.rb'
require 'io/console'

def console(text)

	cols = IO.console.winsize[1]
	
	entries = text.scan /.{#{cols-18}}/
	
	line = "   " + ( '-' * (cols - 8) )
	start = '   <>   '
	last = '   <>   '
	empty_line = start + ' ' * (cols-18) + last
	
	one_liner = ''
	
	unless entries.any?
		one_liner = text 
		
		empty = cols - text.length
		one_liner += ' ' * (empty - 18)
	end
	
	puts
	puts
	print ' ' * (cols/2 - 4)
	puts 'Console'
	puts line
	puts empty_line
	puts empty_line
	entries.each { |entry| print start; print entry; puts last }
	unless one_liner.empty?
		print start
		print one_liner
		puts last
	end
	puts empty_line
	puts empty_line
	puts line
	puts
	
	
end