mutable struct Node
    children::Dict{Char,Node}
    count::Int
end

function searchtree(root, dna)
    currentnode = root
    for i in dna
        if haskey(currentnode.children, i)
            currentnode = currentnode.children[i]
        else
            return 0
        end
    end
    return currentnode.count
end
