ver = "0.1.0";
author = "Axect";
page = "github.com/Axect/Julia/RGE";

# Function Session
function CheckFolder(folder::String)
    Dir = readdir()
    if folder in Dir
        println("$(folder) exists.")
    else
        println("Make folder")
        mkdir("$(folder)")
        CheckFolder("$(folder)")
    end
end

# Script Session
run(`clear`)

println("-------------------------------")
println("  RGE solver  ")
println("  ver $ver   ")
println("  author $author  ")
println("  page $page  ")
println("-------------------------------")
println()
println("__________  ___________________")
println("\\______   \\/  _____/\\_   _____/")
println(" |       _/   \\  ___ |    __)_")
println(" |    |   \\    \\_\\  \\|        \\")
println(" |____|_  /\\______  /_______  /")
println("        \\/        \\/        \\/ ")
println()
println("Loading...")
println()
using Plots

println("-------------------------------")
println("  Check the environment..  ")
println("-------------------------------")
println()
CheckFolder("Data")
CheckFolder("Fig")
println()
println("-------------------------------")
println("  Build...  ")
println("-------------------------------")

run(`go build src/test.go`)

println()
println("Build Complete!")
println()
println("-------------------------------")
println("  Running...  ")
println("-------------------------------")
println()

run(`./test`)

println()
println("-------------------------------")
println("  Plotting...  ")
println("-------------------------------")
println()

gr(size=(1000,600), dpi=300)
Dat = readcsv("Data/test.csv");
value = Dat[:];
plot(Dat, title="Test")
savefig("Fig/test.svg")
println("Plot complete!")
println()
println("-------------------------------")
println("  Converting...  ")
println("-------------------------------")
println()

run(`inkscape -z Fig/test.svg -e Fig/test.png -d 600`)
println("Convert complete!")
