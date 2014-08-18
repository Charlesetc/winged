require 'nokogiri'

class WingedObject
	
	def initialize(styles = {})
		@children = []
		@classes = []
		@styles = styles
		@attributes = {}
		@tag = 'div'
		@parent = nil
	end
	
	def add_child(child)
		child.parent = self
		@children << child
	end
	
	alias_method :<<, :add_child
	alias_method :append, :add_child
	
	def tag(tag)
		@tag = tag
	end
	
	def classes
		@classes
	end
	
	def compile_classes
		
		user_classes = @attributes[:class] || ''
		
		artificial_classes = @classes.join(' ')
		@attributes[:class] = artificial_classes + ' ' + user_classes
	end

	def add_class(user_class)
		@classes << user_class
	end
	
	def set_attribute(attribute, value)
		@attributes[attribute] = value
	end
	
	def get_attribute(attribute)
		@attributes[:attribute]
	end
	
	alias_method :[]=, :set_attribute
	alias_method :[], :get_attribute
	
	def style(style, value)
		@styles[style] = value
	end
	
	def children
		@children
	end
	
	def parent
		@parent
	end
	
	def parent=(object)
		@parent = object
	end
		
	def parent
		@parent
	end
	
	def decorate_tree(tree, document)
		node = Nokogiri::XML::Node.new @tag, document
		
		formatted_styles = format_styles
		unless formatted_styles.empty?
			node[:style] = formatted_styles
		end
				#
		# @attributes[:class] = compile_classes
		
		@attributes.each do |attribute, value|
			node[attribute] = value
		end
		
		textify(node)
		
		tree.add_child node
		
		@children.each do |child|
			child.decorate_tree(node, document)
		end
	end
	
	def format_styles
		style_string = ''
		@styles.each do |key, value|
			key = key.to_s.gsub '_', '-'
			style_string += "#{key}:#{value};"
		end
		style_string
	end
	
	def styles
		@styles
	end
	
	def textify(node)
		
	end
	
	def attributes
		@attributes
	end
	
	def to_hash
		{self => [self.children.each { |child| child.to_hash }]}
	end
	
	
end