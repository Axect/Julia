function TestSpeed()
    A = zeros(10^8)
    for i = 1:length(A)
        A[i] = i^2
    end
end

@time TestSpeed()

# Output: 0.39 seconds