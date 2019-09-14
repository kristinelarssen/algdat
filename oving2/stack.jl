### STACK
function reverseandlimit(array, maxnumber)
    s = []
    for i in length(array):-1:1
        if array[i] > maxnumber
            push!(s, maxnumber)
        else 
            push!(s, array[i])
        end
    end
    return s
end

list = [5, 4, 3, 2, 1]
println(reverseandlimit(list, 3))