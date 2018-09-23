pub fn main() {
    println!("{}", (1 .. 100_000_001).map(|x: u64| 2*x - 1).sum::<u64>());
}
