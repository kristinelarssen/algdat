


function usegreed(coins)
    sum = 1;
    for j = 2:length(coins)
        if coins[j - 1] % coins[j] == 0
            sum += 1
        end
    end

    if sum == length(coins)
        return true
    else
        return false
    end
end
