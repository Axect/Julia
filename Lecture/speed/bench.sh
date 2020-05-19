hyperfine -w 3 "./bin/rust" "./bin/go" "./bin/dmd" "./bin/ldc" "./bin/gdc" "python speed.py" "python speed_numpy.py" "julia speed.jl" --export-markdown data/bench.md
