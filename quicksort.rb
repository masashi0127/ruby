N = 10000;
sort = [];

def QuickSort (bottom, top, data)
    lower = 0
    upper = 0
    div = 0
    temp = 0

    if bottom >= top
        return
    end

    div = data[bottom]

    lower = bottom
    upper = top

    while lower < upper

        while lower <= upper and data[lower] <= div
            lower += 1
        end

        while lower <= upper and data[upper] > div
            upper -= 1
        end

        if lower < upper
            temp = data[lower]
            data[lower] = data[upper]
            data[upper] = temp
        end

    end

    temp = data[bottom]
    data[bottom] = data[upper]
    data[upper] = temp

    QuickSort(bottom, upper - 1, data)
    QuickSort(upper + 1, top, data)

end

i = 0
start_time = 0
end_time = 0

srand(Time.now.to_i)

for i in 0..N
    sort[i] = rand()
end

start_time = Time.now
QuickSort(0, N - 1, sort)
end_time = Time.now
print(end_time - start_time)