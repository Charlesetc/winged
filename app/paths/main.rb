require_relative '../../lib/winged.rb'

def construct_nav
	flow do
		stack do
			link 'Home', href: 'hello'
		end
		stack do
			link 'Next', href: 'hello'
		end
		stack do
			link 'Back', href: 'hello'
		end
		stack do
			link 'Left', href: 'hello'
		end
	end
end

Winged.app do
	
	
	construct_nav
	
	
	s = stack width: '50%', height: '20vh', background_color: 'yellow' do
		
		link 'Hello', href: 'hello', color: 'black', text_decoration: 'none'
		
	end
	
	s[:data-test]
	
end
