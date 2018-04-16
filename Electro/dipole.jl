using PyPlot

mutable struct Position
  x :: Float64
  y :: Float64
end

function Potential(q::Float64, P1::Position, P2::Position)
  (x1, y1) = (P1.x, P1.y);
  (x2, y2) = (P2.x, P2.y);
  return (x,y) -> q * (1/sqrt((x-x1)^2 + (y-y1)^2) - 1/sqrt((x-x2)^2 + (y-y2)^2))
end

function main()
  p1 = Position(1,2);
  p2 = Position(-1,-2);
  q = 2.0;

  pot = Potential(q,p1,p2);

  x = -5:0.1:5;
  y = -5:0.1:5;

  X = repmat(x', length(y), 1);
  Y = repmat(y, 1, length(x));
  Z = map(pot,X,Y);
  
  surf(x,y,Z)
  savefig("native_dipole.png")
end

main()
