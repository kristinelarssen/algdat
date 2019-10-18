### LINKED LIST

mutable struct Node
    next::Union{Node,Nothing} # next kan peke på et Node-objekt eller ha verdien nothing.
    value::Int
end

function createlinkedlist(length)
    # Creates the list starting from the last element
    # This is done so the last element we generate is the head
    child = nothing
    node = nothing

    for i in 1:length
        node = Node(child, rand(1:800))
        child = node
    end
    return node
end


function findindexinlist(linkedlist, index)
    head = linkedlist
    for i in 1:index
        if i == index
            return head.value
        elseif head.next === nothing
            return -1
        else
            head = head.next
        end
    end
end


list1 = createlinkedlist(6)
println(findindexinlist(list1, 4)) #should return value at index 4
println(findindexinlist(list1, 7)) #should return -1


