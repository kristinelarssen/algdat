function lislength(s)
    mls = zeros(Int, size(s))
    mls[1] = 1  # første elementet er alltid 1
    for i = 2:length(s)  # går gjennom alle andre elementene i S
        mls[i] = 1 # alltid 1 
        for n = 1:(i - 1) # går gjennom alle elementene før elementet i
            if s[n] < s[i] # hvis element j er mindre enn elementet så:
                mls[i] = max(mls[i], mls[n] + 1) # sjekker hvem av dem som har flest økende lengdesekvens
            end
        end
    end
    println(mls)
    max_lislength = maximum(mls)
    return max_lislength # Returnerer det største tallet i listen
end
