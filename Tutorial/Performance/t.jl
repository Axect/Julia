function t1()::SharedArray{Float64}
    A = SharedArray{Float64,2}(10000, 10000)
    @parallel for i = 1:length(A)
        for j = 1:length(A[:,1])
            A[i,j] = i+j
        end
    end
    return A
end

function t2()::SharedArray{Float64}
    B = SharedArray{Float64}(10000, 10000)
    @parallel for i = 1:length(B)
        for j = 1:length(B[:,1])
            B[i,j] = i+j
        end
    end
    return B
end