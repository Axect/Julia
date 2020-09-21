struct Person
    name::String
    account::Int64    
end

function Add(p::Person)
    for i=1:1e+06
        p.account += 1
    end
end

A = Person("Axect", 1)
start = time()
Add(A)
elapsed = time() - start
println(A.account, " ", elapsed)