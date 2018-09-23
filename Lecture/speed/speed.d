void main() {
  import std.stdio : writeln;

  ulong s = 0;
  uint[] a;
  a.length = 100_000_000;
  foreach (i; 0 .. 100000000) {
    a[i] = 2*i + 1;
  }
  foreach (x; a) {
    s += x;
  }
  writeln(s);
}
