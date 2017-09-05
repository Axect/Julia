function Sqrt(x)
    if x < 0
        error("Negative x is not allowed")
    end
    return sqrt(x)
end

function main()
    S = readline(STDIN)
    s = parse(Int, chomp(S))
    println(Sqrt(s))
end

main()
