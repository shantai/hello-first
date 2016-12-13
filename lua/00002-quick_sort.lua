function quicksort_r(data, left, right, func_cmp)
    if left >= right then
        return
    end
    local key = data[left]
    local i, j = left, right
    while i < j do
        while j > left and i < j do
            if func_cmp(data[j], key) then
                data[i] = data[j]
                break
            end
            j = j - 1
        end
        while i < right and i < j do
            if func_cmp(key, data[i]) then
                data[j] = data[i]
                break
            end
            i = i + 1
        end
        data[i] = key
    end
    quicksort_r(data, left, i - 1, func_cmp)
    quicksort_r(data, i + 1, right, func_cmp)
end

function sort_compare(a, b)
    return a > b
end

local data = {0, 10, 5, 7, 3, 79, 24, 98, 21}
print(table.concat(data, ", "))

quicksort_r(data, 1, #data, sort_compare)
print(table.concat(data, ", "))
