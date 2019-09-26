
# x - sortert liste
# delta - gir grunnlag for intervallet vi skal finne ved [median-delta, median+delta]
# coordinate - hvilken kolonne som er sortert

function binaryintervalsearch(x, delta, coordinate)
    s = size(x, 1) # antall elementer/rader

    # finne median
    if s % 2 == 0
        median = (x[div(s, 2) + 1, coordinate] + x[div(s, 2), coordinate]) / 2
    else
        median = x[div(s, 2) + 1, coordinate]
    end
    # intervallet tallet må ligge mellom
    start_intervall = median - delta
    end_intervall = median + delta

    # definere default intervallet
    start_index = -1
    end_index = -1

    # finner startindekx
    found = false
    while (! found)
        for i = 1:s
            if (x[i, coordinate] >= start_intervall) && (x[i, coordinate] <= end_intervall)
                start_index = i
                break
            end
        end
        found = true
    end


    #finne slutt indeks
    f = false
    while (! f)
        for i = s:-1:1
            if (x[i, coordinate] >= start_intervall) && (x[i, coordinate] <= end_intervall)
                end_index = i
                break
            end
        end
        f = true
    end

    result = [start_index, end_index]
    return result 
end


x = [1 2; 2 0; 3 3; 4 4]
delta = 0.25
coordinate = 1

println(binaryintervalsearch(x, delta, coordinate)) # --> [-1, -1]


y = [1 2; 2 3; 3 0; 4 0; 5 1]
delta2 = 1.5
coordinate2 = 1
println(binaryintervalsearch(y, delta2, coordinate2)) # --> [2, 4]


z = [1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0]
delta3 = 1
coordinate3 = 1

println(binaryintervalsearch(z, delta3, coordinate3)) # --> [2, 5]