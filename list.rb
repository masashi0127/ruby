require 'scanf'
require 'pp'

class ListNode
    attr_accessor :next, :data

    def initialize(data)
        @next = nil
        @data = data
    end
end

class List
    def index()

        firstNode = lastNode = nil
        buf = 0

        while true
            puts "Please input numbers"

            buf = scanf("%d")

            buf = buf[0]

            if buf != 0
                newNode = nil

                newNode = ListNode.new(buf)

                if lastNode != nil
                    lastNode.next = newNode
                    lastNode = newNode

                else
                    firstNode = lastNode = newNode
                end

                puts "lastNode.data: " + lastNode.data.to_s

            else
                break
            end
        end

        while true
            puts "Please input number which you want to seach"

            buf = scanf("%u")

            buf = buf[0]

            if buf != 0
                thisNode = tempNode = nil

                thisNode = firstNode

                while thisNode != nil

                    puts "thisNode.data: " + thisNode.data.to_s

                    if thisNode.data == buf
                        puts buf.to_s + " is found in inputed numbers"

                        if thisNode != firstNode
                            tempNode.next = thisNode.next

                            if lastNode == thisNode
                                lastNode = tempNode
                            end

                            thisNode.next = firstNode
                            firstNode = thisNode
                        end

                        break
                    end

                    tempNode = thisNode
                    thisNode = thisNode.next
                end

                if thisNode == nil
                    puts buf.to_s + " is not found"
                end
            else
                break
            end
        end
    end
end

list = List.new()
list.index()

