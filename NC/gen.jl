using NetCDF, LinearAlgebra

function write_nc(n)
    m = rand(n, n)
    v = rand(n)
    b = inv(m)
    m_store = reshape(m, n^2)
    inv_store = reshape(b, n^2)
    v_store = v
    mv_store = m * v
    mm_store = reshape(m * m, n^2)
    det_store = [det(m)]

    # Pseudo inv
    pm = rand(n+1, n-1)
    p1 = pinv(pm)
    pm_store = reshape(pm, n^2-1)
    pinv_store = reshape(p1, n^2-1)

    # Solve
    sol = m \ v
    println(sol)

    nccreate(
             "data/randmat_$n.nc", 
             "var", 
             "m", m_store,
             "v", v_store,
             "inv", inv_store,
             "mm", mm_store,
             "mv", mv_store,
             "det", det_store,
             "pm", pm_store,
             "pinv", pinv_store,
             "sol", sol,
    )
end

for i in 4:20
    write_nc(i)
end
