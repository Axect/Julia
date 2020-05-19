pub fn main() {
    println!("{}", (1 .. 100_000_001).map(|x: u64| 2*x - 1).sum::<u64>());
    //let mut v = [0usize; 100_000_000];
    //for i in 0 .. 100_000_000 {
    //    v[i] = 2 * i + 1;
    //}
    //let mut s = 0usize;
    //for elem in v.iter() {
    //    s += elem;
    //}
    //println!("{}", s);
}
