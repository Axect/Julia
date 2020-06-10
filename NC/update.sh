rm ./data/*.nc
rm $HOME/Documents/Project/Rust_Project/Peroxide/test_data/rand_mat/*.nc
julia gen.jl
cp ./data/*.nc $HOME/Documents/Project/Rust_Project/Peroxide/test_data/rand_mat/./
