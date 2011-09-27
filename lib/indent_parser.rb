require "indent_parser/version"

module IndentParser
  def self.parse(content)
    root  = Node.new
    stack = [ root ] 

    content.split(/\r?\n/).each do |line|
      next if line.match(/^\s*$/)

      node  = Node.new(line)
      depth = stack.length

      # node is 1 deeper
      if node.depth == depth + 1
        stack.last.add_child node
        stack << node

      # node is shallower
      elsif node.depth <= depth
        (depth - node.depth).times { stack.pop }
        stack.last.add_child node
        stack << node
      end
    end

    return root
  end

  class Node
    include Enumerable

    attr_accessor :content, :depth

    def initialize(str = nil)
      if str && m = str.match(/^(\s*)(.*)$/) 
        @depth   = (m[1].length / 2) + 1
        @content = m[2]
      else
        @depth = 0
      end
    end

    def each
      children.each { |c| yield(c) }
    end

    def [](index)
      return children[index]
    end

    def children
      return @children ||= []
    end

    def add_child(node)
      children << node
    end

    def to_struct
      return {
        :content => content,
        :depth => depth,
        :children => (children || []).collect { |c| c.to_struct }
      }
    end
  end
end
