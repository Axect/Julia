use peroxide::fuga::*;
use std::f64::consts::PI;

fn main() -> Result<(), Box<dyn Error>> {
    let theta = seq(0, 2f64*PI, 0.01);
    let x = theta.fmap(|th| th.cos());
    let y = theta.fmap(|th| th.sin());

    let mut df = DataFrame::new(vec![]);
    df.push("x", Series::new(x));
    df.push("y", Series::new(y));
    df.print();
    df.write_nc("data.nc")?;

    Ok(())
}
