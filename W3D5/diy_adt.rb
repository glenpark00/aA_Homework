class Stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack.last
    end

    def inspect
        @stack.inspect
    end
end

# ex_stack = Stack.new
# [1,2,3,4,5].each { |ele| ex_stack.push(ele) }
# p ex_stack
# p ex_stack.peek # 5
# p ex_stack.pop # 5
# p ex_stack.pop # 4
# ex_stack.push(16)
# p ex_stack.pop #16 
# p ex_stack

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end

    def inspect
        @queue.inspect
    end
end

# ex_queue = Queue.new
# [1,2,3,4,5].each { |ele| ex_queue.enqueue(ele) }
# p ex_queue.peek # 1
# p ex_queue.dequeue # 1
# p ex_queue.dequeue # 2
# p ex_queue
# ex_queue.enqueue(16)
# p ex_queue.dequeue # 3 
# p ex_queue

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each_with_index do |pair, i|
            if pair[0] == key
                @map[i] = [key, value]
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each { |pair| return pair[1] if pair[0] == key }
        nil
    end

    def delete(key)
        @map.reject! { |pair| pair[0] == key }
    end
end 

# ex_map = Map.new
# ex_map.set('glen', 1)
# ex_map.set('katie', 2)
# ex_map.set('siggy', 3)
# p ex_map
# p ex_map.get('glen') # 1
# p ex_map.get('katie') # 2
# p ex_map.get('someone_else') # nil
# ex_map.delete('siggy')
# p ex_map
