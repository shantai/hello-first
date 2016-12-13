function test_params( ... )
    for k,v in pairs({...}) do
        print(k,v)
    end
end

test_params("a", "b", "c")