# x og y er to sorterte tabeller, coordinate angir koordinat
# i = x indeks
# j = y indeks
function mergearrays(x, y, coordinate)
    i = j = k = 1  #setter indeksene  

    xl = length(x[:, coordinate]) # lengde til x
    yl = length(y[:, coordinate])   # lengde til y
    l_total = xl + yl # total lengde

    l = [x; Inf Inf] # legger til inf slik at når ene tabellen er ferdig og ikke andre, så skal det bli lagt til kun fra den ene. 
    r = [y; Inf Inf]
    result = [zeros(Int64, l_total) zeros(Int64, l_total)] # resultattabell med 0 er 

    while k <= l_total
        if l[i, coordinate] <= r[j, coordinate]
            result[k, :] = l[i, :]
            i += 1
            k += 1
        else
            result[k, :] = r[j, :]
            j += 1
            k += 1
        end
    end

    return result 

end

# x - usortert tabell
# coordinate  - angir koordinat vi skal sortere langs
# l - left side
# r - right side
# s - antall elementer/rader i listen/matrisen
function mergesort(x, coordinate)
    s = size(x, 1)  # antall rader, hadde det stått 2 hadde det vært antall kolonner
    
    if s == 1          # "antall rader" / antall elementer i listen, hvis den er lik 1, er vi ferdig
        return x
    end
    
    if s % 2 == 0;
        l = mergesort(x[1:div(s, 2), :], coordinate)     #div(size(x,1),2)  -> deler anttall elementer i listen på 2, og returnerer det siste heltallet som er delbart. 
        r = mergesort(x[div(s, 2) + 1:end, :], coordinate)
    
    else
        l = mergesort(x[1:div(s, 2) + 1, :], coordinate)
        r = mergesort(x[div(s, 2) + 2:end, :], coordinate)
    end
    return mergearrays(l, r, coordinate)
end


y = [2 0; 1 0; 3 0]
println(mergesort(y, 1))



