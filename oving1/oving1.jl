function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i = j-1
        while i > 0 && A[i] > key
            A[i+1] = A[i]
            i -= 1
        end
        A[i+1] = key
    end
end


liste = [4,3,2,5,7,1,6]
insertionsort!(liste)
println(liste)