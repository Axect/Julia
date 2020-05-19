# Rust
rustc -O -o ./bin/rust speed.rs
# DMD
dmd -O -of=bin/dmd speed.d
# LDC
ldc -O -of=bin/ldc speed.d
# GDC
gdc -O -o bin/gdc speed.d
# GO
go build -o bin/go speed.go
