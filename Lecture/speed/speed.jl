function TestSpeed()
    reduce(+, map(x -> 2*x - 1, 1:10^8))
    #A = zeros(10^8)
    #for i = 1:length(A)
    #    A[i] = 2 * i - 1
    #end
    #s = 0
    #for i in 1:length(A)
    #  s += A[i]
    #end
    #return s
end

println(@time TestSpeed())
# Output: 0.39 seconds
