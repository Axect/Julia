# Make Sequence : Geometric Sequence
A = zeros(10)
for i=1:10
    A[i] = 2^i
end

writecsv("test.csv", A)

C = ["Galaxy" "Planet"; "Milky Way" "Earth"]
writecsv("galaxy.csv", C)