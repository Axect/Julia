import matplotlib.pyplot as plt
import pandas as pd

# Load csv
dj1 = pd.read_csv("bench/bench_julia_map.csv")
dj2 = pd.read_csv("bench/bench_julia_vmap.csv")
dj3 = pd.read_csv("bench/bench_julia_vmapnt.csv")
dj4 = pd.read_csv("bench/bench_julia_vmap2.csv")
dj5 = pd.read_csv("bench/bench_julia_vmapnt2.csv")
dj6 = pd.read_csv("bench/bench_julia_avx.csv")
dj7 = pd.read_csv("bench/bench_julia_vectorize.csv")

# Use latex
plt.rc('text', usetex=True)
plt.rc('font', family='serif')

# Prepare Plot
plt.figure(figsize=(10,6), dpi=300)
plt.title(r"Benchmark for map", fontsize=16)
plt.xlabel(r'size', fontsize=14)
plt.ylabel(r'time(s)', fontsize=14)

domain = [p for p in dj1["param"]]

# Plot with Legends
plt.loglog(domain, dj1["mean"], marker='o', label=r'julia(map)')
plt.fill_between(domain, dj1["min"], dj1["max"], alpha=0.2)

plt.loglog(domain, dj2["mean"], marker='o', label=r'julia(vmap)')
plt.fill_between(domain, dj2["min"], dj2["max"], alpha=0.2)

plt.loglog(domain, dj3["mean"], marker='o', label=r'julia(vmapnt)')
plt.fill_between(domain, dj3["min"], dj3["max"], alpha=0.2)

plt.loglog(domain, dj4["mean"], marker='o', label=r'julia(vmap!)')
plt.fill_between(domain, dj4["min"], dj4["max"], alpha=0.2)

plt.loglog(domain, dj5["mean"], marker='o', label=r'julia(vmapnt!)')
plt.fill_between(domain, dj5["min"], dj5["max"], alpha=0.2)

plt.loglog(domain, dj6["mean"], marker='o', label=r'julia(avx)')
plt.fill_between(domain, dj6["min"], dj6["max"], alpha=0.2)

plt.loglog(domain, dj7["mean"], marker='o', label=r'julia(vectorize)')
plt.fill_between(domain, dj7["min"], dj7["max"], alpha=0.2)

# Other options
plt.legend(fontsize=12)
plt.grid()
plt.savefig("bench.png", dpi=300)

