

function mincoinsgreedy(coins, value)
    sum = 0; # antall mynter man må bruke
    v = value; # for å holde styr på hvor mye kroner man ikke har vekslet

    for i = 1:length(coins)  # går gjennom alle de ulike myntene, begynner med største
        if v == 0  # hvis vi ikke har mer å veskle, så returneres antall mynter
            return sum
        end

        d = div(v, coins[i]) # sjekker om man kan bruke denne myntstørrelse til å veksle beløpet

        if d > 0  # hvis ja, er denne større enn 0
            v -= d * coins[i] # trekker da fra beløpet vi kunne veksle
            sum += d # legger til antall mynter vi brukte
        end
    end
    return sum  # returnerer summen
    
end


