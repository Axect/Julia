using LsqFit, NCDataFrame, DataFrames

# preparing data for fitting
xdata = [ 15.2; 19.9;  2.2; 11.8; 12.1; 18.1; 11.8; 13.4; 11.5;  0.5;
          18.0; 10.2; 10.6; 13.8;  4.6;  3.8; 15.1; 15.1; 11.7;  4.2 ]
ydata = [ 0.73; 0.19; 1.54; 2.08; 0.84; 0.42; 1.77; 0.86; 1.95; 0.27;
          0.39; 1.39; 1.25; 0.76; 1.99; 1.53; 0.86; 0.52; 1.54; 1.05 ]

# defining a model
model(x, β) = β[1] * ((x/β[2]).^(β[3]-1)) .* (exp.(-(x/β[2]).^β[3]))

# run the curve fitting algorithm
fit = curve_fit(model, xdata, ydata, [3.0, 8.0, 3.0])

# results of the fitting
β_fit = fit.param
errors = margin_error(fit)

# preparing for netcdf
xfit = 0:0.1:20
yfit = model(xfit, β_fit)

len = length(xfit)

ds = DataFrame()
ds[!,:xdata] = fillmissing(xdata, len)
ds[!,:ydata] = fillmissing(ydata, len)
ds[!,:xfit] = xfit
ds[!,:yfit] = yfit

writenc(ds, "data.nc")

## create netcdf
#ds = Dataset("data.nc", "c")
#
## define dimension
#defDim(ds, "data", length(xdata))
#defDim(ds, "fit", length(xfit))
#
## define variables
#defVar(ds, "xdata", xdata, ("data",));
#defVar(ds, "ydata", ydata, ("data",));
#defVar(ds, "xfit", xfit, ("fit",));
#defVar(ds, "yfit", yfit, ("fit",));

# close
#close(ds)
