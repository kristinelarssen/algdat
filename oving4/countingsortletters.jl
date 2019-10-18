

function countingsortletters(A, position)    

    l = length(A)

    C = zeros(Int64, 27)  # lager en liste med 27 elementer med 0
    B = Array{String}(undef, l) # lager en ny tom liste av strenger, med lik lengde som A
    
    # teller hvor mange det er av hver bokstav
    for i = 1:l
        char_value = chartodigit(A[i][position])
        C[char_value] += 1
    end
    
    #legger til hvor mange elementer som er lik eller mindre enn i
    for i = 2:27
        C[i] += C[i - 1]
    end

    for i = l:-1:1
        value = chartodigit(A[i][position])
        B[C[value]] = A[i]
        C[value] -= 1
    end

    return B
    
end


function chartodigit(character)
    #Dette er en hjelpefunksjon for å få omgjort en char til tall
    #Den konverterer 'a' til 1, 'b' til 2 osv.
    #Eksempel: chartodigit("hei"[2]) gir 5 siden 'e' er den femte bokstaven i alfabetet.

    return character - '`'
end


println(countingsortletters(["ccc", "cba", "ca", "ab", "abc"], 2))

# ["ca", "cba", "ab", "abc", "ccc"]