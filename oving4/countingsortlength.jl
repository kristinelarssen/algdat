

function countingsortlength(A)
    
    k = -1
    for i = 1:length(A)
        if length(A[i]) > k
            k = length(A[i])
        end
    end

    # fordi julia er 1-indeksert og 0 er også med, så antall med lengde 0 blir på liste indeks 1 osv..
    k += 1
    
    C = zeros(Int64, k)
    B = Array{String}(undef, length(A))

    for i = 1:length(A)
        C[length(A[i]) + 1] += 1
    end

    for i = 2:k
        C[i] += C[i - 1]
    end

    for i = length(A):-1:1
        B[C[length(A[i]) + 1]] = A[i]
        C[length(A[i]) + 1] -= 1
    end


    return B
end

println(countingsortlength(["bbbb", "aa", "aaaa", "ccc", ""]))

# ["aa", "ccc", "bbbb", "aaaa"]