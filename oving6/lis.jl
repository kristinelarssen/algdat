function lis(s, mls)
    max_l = maximum(mls)
    liste = zeros(Int, max_l)
    for i = length(mls):-1:1
        # Din kode her
        if mls[i] == max_l  # sjekker om elementet vi er i i mls er det største elementet. Omså så:
            liste[max_l] = s[i]  # setter vi det bakreste ledigste elementet i liste lik elementet med indeks lik max_lengde i S
            max_l = max_l - 1 # minker max lengde med 1 for å finne det neste tallet som er med i sekvensen.
        end
    end
    return liste
end

