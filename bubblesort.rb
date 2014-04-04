N = 10000
sort = []

def BubbleSort(sort)
    i = 0
    j = 0
    flag = false
    k = 0

    while true
        flag = true

        for i in 0..(N - 1 - k)

            if sort[i] > sort[i + 1]
                flag = false
                j = sort[i]
                sort[i] = sort[i + 1]
                sort[i + 1] = j
            end

        end

        k += 1
        
        if flag == true
            break
        end

    end

end

i = 0
start_time = 0
end_time = 0

srand(Time.now.to_i)

for i in 0..N
    sort[i] = rand()
end

start_time = Time.now
BubbleSort(sort)
end_time = Time.now
print(end_time - start_time)
