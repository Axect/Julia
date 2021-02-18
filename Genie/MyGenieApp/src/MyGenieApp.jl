module MyGenieApp

using Genie, Logging, LoggingExtras

function main()
  Base.eval(Main, :(const UserApp = MyGenieApp))

  Genie.genie(; context = @__MODULE__)

  Base.eval(Main, :(const Genie = MyGenieApp.Genie))
  Base.eval(Main, :(using Genie))
end

end
