function Hello()
	A = zeros(1000,1)
	for i=1:length(A)
		A[i] = i^2
	end
	return A
end

println(Hello())
