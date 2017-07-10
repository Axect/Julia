a = 1:1e+06
s = 0
start = time()
for i in a
    s += i
end
End = time()
println(s, " ", End-start)
start2=time()
b = sum(a)
End2=time()
println(b, " ", End2-start2)