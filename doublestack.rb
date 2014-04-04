# reverse polish notation

require 'scanf'
require 'pp'

class StackOverflowException < Exception
end

class StackUnderflowException < Exception
end

class DoubleStack
    def initialize(stackMaxSize)
        @stackMaxSize = stackMaxSize
        @stack = []
        @stackTop = 0
    end

    def push(val)
        if @stackTop == @stackMaxSize
            raise StackOverflowException

        else
            @stack[@stackTop] = val
            puts "stack value is " + @stack[@stackTop].to_s
            @stackTop += 1
        end
    end

    def pop()
        if (@stackTop == 0)
            raise StackUnderflowException

        else
            @stackTop -= 1
            return @stack[@stackTop]
        end
    end

    def size()
        return @stackTop
    end

    def doubleAt(i)
        return @stack[i]
    end

    def isEmpty()
        return (@stackTop == 0)
    end
end

if __FILE__ == $0
    doubleStack = nil

    doubleStack = DoubleStack.new(10)

    while true
        puts "現在のスタック(" + doubleStack.size().to_s + ")"

        for i in 0..doubleStack.size() - 1
            puts doubleStack.doubleAt(i).to_s + " "
        end

        begin
            cal1 = cal2 = 0
            buf = scanf("%s")

            if buf[0] == "+"
                cal1 = doubleStack.pop().to_i
                cal2 = doubleStack.pop().to_i
                doubleStack.push(cal2 + cal1)
            
            elsif buf[0] == "-"
                cal1 = doubleStack.pop().to_i
                cal2 = doubleStack.pop().to_i
                doubleStack.push(cal2 - cal1)

            elsif buf[0] == "*"
                cal1 = doubleStack.pop().to_i
                cal2 = doubleStack.pop().to_i
                doubleStack.push(cal2 * cal1)

            elsif buf[0] == "/"
                cal1 = doubleStack.pop().to_i
                cal2 = doubleStack.pop().to_i
                doubleStack.push(cal2 / cal1)

            elsif buf[0] == "="
                break

            else
                doubleStack.push(buf[0])
            end

        rescue IOError => e
            puts e.message

        rescue Exception => e
            puts e.message
        end
    end

    puts "実行結果は " + doubleStack.pop().to_s + " です"

    if doubleStack.isEmpty() == false
        puts "スタックにまだ数字が残っています"
    end
end


