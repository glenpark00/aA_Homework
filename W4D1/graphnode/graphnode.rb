require 'Set'
require 'byebug'

class GraphNode
    attr_reader :value
    attr_accessor :neighbors

    def initialize(val)
        @value = val
        @neighbors = []
    end

    def inspect
        value.inspect
    end

end

def bfs(starting_node, target_value)
    visited = Set[]
    queue = [starting_node]
    until queue.empty?
        curr_node = queue.shift
        return curr_node if curr_node.value == target_value
        visited.add(curr_node)
        curr_node.neighbors.each { |neighbor| queue.push(neighbor) unless visited.include?(neighbor) }
    end 
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a, "b")
p bfs(a, "f")
