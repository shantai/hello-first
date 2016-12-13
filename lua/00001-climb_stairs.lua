------------------------------------------------------- 1
-- 一共多少种走法 ？
function fib_n_2(total)
    if total < 3 then
        return total
    else
        return fib_n_2(total - 1) + fib_n_2(total - 2)
    end
end

for i = 1, 5 do
    print("------------------------- "..i)
    print("total: "..fib_n_2(i).."\n")
end

------------------------------------------------------- 2
-- 打印每一种走法呢 ？
function fib_n_2_print(total, r)
    if total < 3 then
        if total == 1 then
            print(r.."1")
        elseif total == 2 then
            print(r.."1, 1")
            print(r.."2")
        end
        return total
    else
        return fib_n_2_print(total - 1, r.."1, ") + fib_n_2_print(total - 2, r.."2, ")
    end
end

for i = 1, 5 do
    print("------------------------- "..i)
    print("total: "..fib_n_2_print(i, "").."\n")
end

------------------------------------------------------- 3
-- 如果是 n 层台阶，每次最多走 m 个台阶，多少中走法 ？ 并打印呢 ？
function fib_n_m(total, max_step)
    if total <= max_step then
        return total
    else
        local sum = 0
        for i = 1, max_step do
            sum = sum + fib_n_m(total - i, max_step)
        end
        return sum
    end
end

for i = 1, 5 do
    print("------------------------- "..i)
    print("total: "..fib_n_m(i, 3).."\n")
end

------------------------------------------------------- 4
-- 并打印呢 ？
local set = {}

function fib_set_n_n(n)
    -- set[1] = { "1" }
    -- set[2] = { "1, 1", "2" }
    -- set[3] = { "1, 1, 1", "2, 1", "1, 2", "3"  }

    if n == 1 then
        set[1] = {"1"}
        return set[1]
    end
    
    local sub = set[n]
    if not sub then
        sub = {}
        set[n] = sub
        fib_set_n_n(n - 1)

        for i = 1, n - 1 do
            for p, v in ipairs(set[n - i]) do
                table.insert(sub, v..", "..i)
            end
        end

        table.insert(sub, tostring(n))
    end
    return sub
end

function fib_n_m_print(total, max_step, r)
    if total <= max_step then
        local step = fib_set_n_n(total)
        for i,v in ipairs(step) do
            print(r..v)
        end

        return total
    else
        local sum = 0
        for i = 1, max_step do
            sum = sum + fib_n_m_print(total - i, max_step, r..i..", ")
        end
        return sum
    end
end

for i = 1, 5 do
    print("------------------------- "..i)
    print("total: "..fib_n_m_print(i, 3, "").."\n")
end
