### DOUBLE LINKED LIST


mutable struct NodeDoublyLinked
    prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
    next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
    value::Int # Verdien til noden
end

function createLinkedListDoublyLinked(length)
    # Create the list from the last element in the chain
    # This is so the returned element will be the first in the chain
    current = nothing
    beforeCurrent = nothing

    for i in 1:length
        # only fill out the next field because prev will be filled out later
        current = NodeDoublyLinked(nothing, beforeCurrent, rand(-100:100))
        # link up the node before this node to this node
        if beforeCurrent != nothing
            beforeCurrent.prev = current
        end
        beforeCurrent = current
    end
    return current
end

## !! linkedlist is not necessary the head  
function maxofdoublelinkedlist(linkedlist)
    max = -111 #cause linkelist can have values between -100 and 100

    #from input-node to the end of the double linkedlist
    currentnode = linkedlist
    last = false
    while (! last)
        if currentnode.value > max
            max = currentnode.value
        end
        if currentnode.next == nothing
            last = true
        else
            currentnode = currentnode.next
        end
        
    end


    #from input-node to the start of the double linkedlist
    currentnode = linkedlist
    first = false
    while (! first)
        if currentnode.value > max
            max = currentnode.value
        end
        if currentnode.prev == nothing
            first = true
        else
            currentnode = currentnode.prev
        end
        
    end

    return max
end 

list1 = createLinkedListDoublyLinked(6)
list5 = createLinkedListDoublyLinked(6)
println(maxofdoublelinkedlist(list1))
