from netCDF4 import Dataset
import matplotlib.pyplot as plt

# Import netCDF file
#ncfile = './data.nc'
ncfile = "./circ/data.nc"
data = Dataset(ncfile)
var = data.variables

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Prepare Plot
plt.figure(figsize=(10,10))
plt.title(r"Circle", fontsize=16)
plt.xlabel(r'$x$', fontsize=14)
plt.ylabel(r'$y$', fontsize=14)

# Prepare Data to Plot
x = var['x'][:]
y = var['y'][:]  

# Plot with Legends
plt.plot(x, y, label=r'$x^2 + y^2 = 1$')

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("plot.png", dpi=300)
