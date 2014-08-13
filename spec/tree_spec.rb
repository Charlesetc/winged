require 'spec_helper'

describe 'Winged' do
	
	describe 'Tree' do
		
		before(:each) do
			
			@app = Winged.app do
				@s = stack do
				end
				stack color: 'blue' do
					stack do
						@l = link 'Google', href: 'www.google.com'
					end
				end
			end
			
		end
		
		
		describe 'after build' do
			
			before(:each) do
				@b = WingedBuilder.new @app
				@html = @b.to_html
			end
			
			describe 'Link' do
				
				it 'should display properly' do
					@html.should match /<a href=['"]www.google.com["']>Google<\/a>/ 
				end
				
			end
			
			
			it 'should display styles properly' do
				@html.should match /<div style=['"]color:blue;["']>/
			end
			
 			it 'should display attributes properly' do
				
				@s[:id] = 'my_id'
				
				@b = WingedBuilder.new @app
				@b.to_html.should match /<div id=['"]my_id['"]>/
			end

		end
			
	end
	
end