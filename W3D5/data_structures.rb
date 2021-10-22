class Stack
    def initizialize
        @stack = []
    end

    def push(el)
        @stack.unshift(ele)
    end

    def pop
        @stack.shift
    end

    def peek
        @stack[0]
    end
end

class Queue
    def initizialize
        @queue = []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end
end

class map
    def initizialize
        @map = []
    end

    def set(key, value)
        @map.each do |pair|
            if pair[0] == key
                pair[1] = value
                return
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |pair|
            return pair[1] if pair[0] == key
        end
        nil
    end

    def delete(key)
        @map.each do |pair|
            if pair[0] == key
                @map.delete(pair)
                return
            end
        end
        return nil
    end

    def show
        @map.each do |pair|
            puts pair
        end
    end
end