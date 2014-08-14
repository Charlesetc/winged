
require 'nokogiri'

class WingedBuilder
	
	def initialize(root = nil, title = 'Hello World')
		
		@root = root
		
		@document = Nokogiri::HTML::Document.parse "<!doctype html>"
		
		@html = Nokogiri::XML::Node.new "html", @document
		
		@head = Nokogiri::XML::Node.new "head", @document
		
		@title = Nokogiri::XML::Node.new "title", @document
		
		@style = Nokogiri::XML::Node.new "style", @document
		
		@body = Nokogiri::XML::Node.new "body", @document
		
		@html.add_child @head
		
		@title.content = title
		
		css = '* {
		padding:0;
		margin:0;
		box-sizing:border-box;
		font-size: 100%;
		font:inherit;
	  }
		ol, ul {
			list-style: none;
		}
		p, span {
		display:inline
		}
		.stack > * {
			display:block
		}
		
		.flow > * {
			display:inline-block
		}
		'
		
		@style.content = css
		
		@head.add_child @title
		
		@head.add_child @style
		
		@html.add_child @body
		
		@document.add_child @html
		
		self.compile
		
	end
	
	def compile
		@root.decorate_tree @body, @document
	end
	
	def to_html
		@document.to_html(indent: 2)
	end
	
	
	# Just for Development
	def inspect
		to_html
	end
	
end