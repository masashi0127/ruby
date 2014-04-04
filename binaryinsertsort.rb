require 'pp'

N = 10000

def BinaryInsertSort(sort)
    i = sorted = temp = insert = 0
    left = mid = right = 0

    for sorted in 1..N
        insert = sort[sorted]

        left = 0
        right = sorted

        while left < right
            mid = (left + right) / 2

            if sort[mid] < insert
                left = mid + 1
            else
                right = mid
            end
        end

        i = left

        while i <= sorted
            temp = sort[i]
            sort[i] = insert
            insert = temp
            i += 1
        end
    end
end

i = 0
start_time = 0
end_time = 0
sort = []

srand(Time.now.to_i)

for i in 0..N
    sort[i] = rand()
end

start_time = Time.now
BinaryInsertSort(sort)
end_time = Time.now
pp end_time - start_time
