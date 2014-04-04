require 'pp'

N = 10000
sort = []

def CombSort(sort)
    i = 0
    flag = true
    temp = 0
    gap = 0

    gap = N

    while true
        gap = gap * 10 / 13

        if gap == 0
            gap = 1
        end

        flag = true

        for i in 0..(N - gap)

            if sort[i] > sort[i + gap]
                temp = sort[i]
                sort[i] = sort[i + gap]
                sort[i + gap] = temp
                flag = false
            end
        end

        if gap > 1 or flag == true
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
CombSort(sort)
end_time = Time.now
pp end_time - start_time