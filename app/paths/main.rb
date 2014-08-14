require_relative '../../lib/winged.rb'

Winged.app do
	
	stack width: '50%', height: '20vh', background_color: 'yellow' do
		
		link 'Hello', href: 'www.hello.com', color: 'black', text_decoration: 'none'
		
	end
	
end