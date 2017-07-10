type Person
    name::String
    account::Int64    
end

function Add(p::Person)
    p.account += 1
end

A = Person("Axect", 1)
Add(A)
print(A.account)