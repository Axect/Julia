from netCDF4 import Dataset
import matplotlib.pyplot as plt

# Import netCDF file
ncfile = './curve_fit/data2.nc'
data = Dataset(ncfile)
var = data.variables

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Prepare Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Curve fitting", fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)

# Prepare Data to Plot
x = var['xdata'][:]
y = var['ydata'][:]  
xfit = var['xfit'][:]
yfit = var['yfit'][:]  

# Plot with Legends
plt.plot(x, y, '.', label=r'Data')
plt.plot(xfit, yfit, label=r'Fit')

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("plot2.png", dpi=300)
