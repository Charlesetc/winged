
require 'spec_helper'

describe 'Winged' do
	
	before(:each) do
		@r = WingedObject.new
		3.times do
			@w = WingedObject.new display: 'block'
			2.times do
				@l = WingedObject.new
				@l[:class] = 'elle'
				@w << @l
			end
			@r << @w
		end
		@k = WingedText.new 'Text goes here', color: 'blue'
		@w << @k
	end
	
	describe "Builder" do
		
		before(:each) do
			@b = WingedBuilder.new @r
			@html = @b.to_html
		end
		
		it "should build an html document" do
			@html.should match /html/
			@html.should match /head/
			@html.should match /style/
			@html.should match /title/
			@html.should match /doctype/i
		end
		
		it "should style properly" do
			@html.should match /class="elle"/
		end
		
		it "should attribute properly" do
			@html.should match /style="display:block;/
		end
		
		it 'should display text properly' do
			@html.should match /<span.*>Text goes here<\/span>/
		end
		
	end
	
	describe 'Text' do
		
		before(:each) do
			@t = WingedText.new 'hello', display: 'block', border: 'none'
			@l = WingedObject.new 'size' => 'large'
			@t << @l
			@w << @t
			@b = WingedBuilder.new @r
			@html = @b.to_html
		end
		
		it 'should have children elements' do
			@html.should match /<span.*>hello<div.*><\/div><\/span>/
		end
		
	end
	
end