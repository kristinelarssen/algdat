
function splitintwo(x, y)
    
    size_x = size(x, 1)   # antall elementer i x

    # splits x
    if size_x % 2 == 1
        x_left = x[1:div(size_x, 2) + 1, :]
        x_right = x[div(size_x, 2) + 2:end, :]
    else
        x_left = x[1:div(size_x, 2), :]
        x_right = x[div(size_x, 2) + 1:end, :]
    end

    y_left = [0 0] # lager listene som jeg skal legge de sorterte elementene i
    y_right = [0 0] # men disse blir senere slettet
   
    size_y = size(y, 1) # antall elementer i y

    for i = 1:size_y
        y_i = reshape(y[i, :], (1, 2))  # --> gir hver del element av y --> [7.0 1.0] feks

        #ettersom X-venstre og Y-venstre skal inneholde de samme punktene, kan man sjekke hvilken liste
        # del-elementet skal i.
        if inArray(y_i, x_left) # sjekker om del-elementet er en del av den venstre X lista
            y_left = [y_left; y_i] #omså skal den til venstre på Y lista
        else
            y_right = [y_right; y_i] # hvis ikke skal den til høyre på Y lista
        end
    end

    y_left = y_left[2:end, :] # sletter 0ene i starten av listene
    y_right = y_right[2:end, :]


    return x_left, x_right, y_left, y_right
end


# sjekker om del-elementet yi er en del av X-listen
function inArray(yi, x)
    for i = 1:Int(length(x) / 2)
        xi = x[i, :]
        if yi[1] == xi[1] && yi[2] == xi[2]
            return true
        end
    end
    return false
end


x = [1.0 2.0; 2.0 3.0; 3.0 2.0; 4.0 5.0; 6.0 6.0; 7.0 1.0] 
# --> x-venstre =   [1.0 2.0; 2.0 3.0; 3.0 2.0]  
# --> x-høyre =     [4.0 5.0; 6.0 6.0; 7.0 1.0]

y = [7.0 1.0; 1.0 2.0; 3.0 2.0; 2.0 3.0; 4.0 5.0; 6.0 6.0]
# --> y-venstre =   [1.0 2.0; 3.0 2.0; 2.0 3.0] 
# --> y-høyre =     [7.0 1.0; 4.0 5.0; 6.0 6.0]






println(splitintwo(x, y))
