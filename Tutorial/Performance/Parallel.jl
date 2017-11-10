using Distributions

function DataProc(n::Int)
    d = Normal(4, 2)
    x = rand(d, n)
    return length(x)
end

function NTest()
    for i = 1:4
        println(DataProc(Int(1E+08)))
    end
end

function PTest()
    @parallel for i=1:4
        println(DataProc(Int(1E+08)))
    end
end
