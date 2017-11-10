function Mass_Dist(Halo_Pos::Array{Float64,2}, Halo_Mass::Array{Float64,1}, Gas_Pos::Array{Float64,2}, Gas_Mass::Array{Float64,1}) ::SharedArray{Float64,2}
  HPos = Halo_Pos.*h100/kpc
  GPos = Gas_Pos.*h100/kpc
  Mass = SharedArray{Float64,2}(length(Hist_x),length(Hist_y))
  @parallel for i = 1:length(Hist_x)
    for j = 1:length(Hist_y)
      Bol = (((HPos[1,:].>Hist_x[i])).*((HPos[1,:].<Hist_x[i]+Hist_bin)).*((HPos[2,:].>Hist_y[j])) .* ((HPos[2,:].<Hist_y[j]+Hist_bin)))     
      Mass[i,j] = sum(Halo_Mass[Bol]./M10_sun)
      Bol = (((GPos[1,:].>Hist_x[i])).*((GPos[1,:].<Hist_x[i]+Hist_bin)).*((GPos[2,:].>Hist_y[j])) .* ((GPos[2,:].<Hist_y[j]+Hist_bin)))     
      Mass[i,j] += sum(Gas_Mass[Bol]./M10_sun)
    end
  end
  return Mass
end
function Dens_Dist(Gas_Pos::Array{Float64,2}, Gas_Mass::Array{Float64,1}) ::SharedArray{Float64,2}
  Pos = Gas_Pos.*h100/kpc
  Dens = SharedArray{Float64}(length(Hist_x),length(Hist_y))
  @parallel for i = 1:length(Hist_x)
    for j = 1:length(Hist_y)
      Bol = (((Pos[1,:].>Hist_x[i])).*((Pos[1,:].<Hist_x[i]+Hist_bin)).*((Pos[2,:].>Hist_y[j])).* ((Pos[2,:].<Hist_y[j]+Hist_bin)))     
      Dens[i,j] = (sum(Gas_Mass[Bol])/(Hist_bin*kpc)^2.)
    end
  end
  return Dens
end
