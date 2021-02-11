#[macro_use]
extern crate peroxide;
use peroxide::fuga::*;

fn main() {
    let xdata = vec![ 15.2, 19.9,  2.2, 11.8, 12.1, 18.1, 11.8, 13.4, 11.5,  0.5,
          18.0, 10.2, 10.6, 13.8,  4.6,  3.8, 15.1, 15.1, 11.7,  4.2 ];
    let ydata = vec![ 0.73, 0.19, 1.54, 2.08, 0.84, 0.42, 1.77, 0.86, 1.95, 0.27,
          0.39, 1.39, 1.25, 0.76, 1.99, 1.53, 0.86, 0.52, 1.54, 1.05 ];

    let data = hstack!(xdata.clone(), ydata.clone());
    let beta_init = vec![3f64, 6f64, 4f64];

    let mut opt = Optimizer::new(data, model);

    let p = opt
        .set_init_param(beta_init)
        .set_method(LevenbergMarquardt)
        .set_max_iter(70)
        .optimize();

    p.print();

    let xfit = seq(0, 20, 0.1);
    let yfit = model(&xfit, p.to_ad_vec()).unwrap().to_f64_vec();

    let mut df = DataFrame::new(vec![]);
    df.push("xdata", Series::new(xdata));
    df.push("ydata", Series::new(ydata));
    df.push("xfit", Series::new(xfit));
    df.push("yfit", Series::new(yfit));
    df.print();

    df.write_nc("data2.nc").expect("Can't write nc file");
}

fn model(x: &Vec<f64>, beta: Vec<AD>) -> Option<Vec<AD>> {
    Some(
        x.clone().into_iter()
            .map(|t| AD::from(t))
            .map(|t| beta[0] * ((t/beta[1]).pow(beta[2] - 1f64)) * (-(t/beta[1]).pow(beta[2])).exp())
            .collect()
    )
}
