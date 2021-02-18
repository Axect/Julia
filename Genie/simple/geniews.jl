using Genie, Genie.Router
using Genie.Renderer, Genie.Renderer.Html, Genie.Renderer.Json

route("/hello.html") do
    html("Hello World")
end

route("/hello.json") do
    json("Hello World")
end

route("/hello.txt") do
    respond("Hello World", :text)
end

up(8001, async = false)
