using Genie

using Genie.Renderer.Json
using  Genie.Requests
# Define a method that adds two numbers


route("/add", method = POST) do
    num1 = params(:num1, "0")
    num2 = params(:num2, "0")
    summ = parse(Int,num1) + parse(Int,num2)
    # return a JSON response
    ("result" => summ) |> json
end


route("/addjson", method = POST) do
    @show jsonpayload()
    @show rawpayload()

    rjson = Genie.Renderer.Json.JSON.parse(rawpayload())
    summ = rjson["num1"] + rjson["num2"]
    ("result" => summ) |> json
end


up(8899)

# Run this script in the terminal with the following command:
# julia genie_webservice.jl

# Then, open a new terminal window and run the following command:
# curl -s -X POST -d "num1=5&num2=10" http://127.0.0.1:8899/add

# or

# curl -s -X POST -H "Content-Type: application/json" -d "{\"num1\":3, \"num2\":440}" http://127.0.0.1:8899/addjson
