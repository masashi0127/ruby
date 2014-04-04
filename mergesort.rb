require 'pp'

N = 10000
sort = []
$buffer = []

def MergeSort(n, x, offset)
    i = 0
    j = 0
    k = 0
    m = 0

    if n <= 1
        return
    end

    m = n / 2

    MergeSort(m, x, offset)
    MergeSort(n - m, x, offset + m)

    for i in 0..m
        $buffer[i] = x[offset + i]
    end

    j = m
    i = k = 0

    while i < m and j < n

        if $buffer[i] <= x[offset + j]
            x[offset + k] = $buffer[i]
            k += 1
            i += 1

        else
            x[offset + k] = x[offset + j]
            k += 1
            j += 1
        end

    end

    while i < m
        x[offset + k] = $buffer[i]
        k += 1
        i += 1
    end

    # pp x
    # pp caller()

end

i = 0
start_time = 0
end_time = 0

srand(Time.now.to_i)

for i in 0..N
    sort[i] = rand()
end

start_time = Time.now
MergeSort(N, sort, 0)
end_time = Time.now
pp end_time - start_time