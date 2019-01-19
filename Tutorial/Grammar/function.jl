function T(x)
  return f(x) + 1
end

function f(x)
  return 2*x
end

println(T(3))
