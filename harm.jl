function Harmonic(n)
    if n < 0
        println("Error: n should be positive or zero")
        exit(1)
    end
    temp = string(n + 1/2)
    return "$temp""h"
end

function Converter(str)
    temp = str[1:end-1]
    temp = float(temp)
    return temp * 6.582119514*1e-16
end

function main()
    print("Input:"); n = float(readline(STDIN))
    println("Energy:", Harmonic(n))
    println("Real Energy:", Converter(Harmonic(n)))
    return 0;
end

main()