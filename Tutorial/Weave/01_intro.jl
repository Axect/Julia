import Pkg

Pkg.add("Weave")

Pkg.add.(["Plots", "DSP"])

using Weave

filename = normpath(:pwd, "FIR_design.jmd")

println(filename)

weave(filename; doctype = "md2html", out_path = :pwd)
weave(filename; doctype = "md2pdf", out_path = :pwd)
weave(filename; doctype = "pandoc", out_path = :pwd)