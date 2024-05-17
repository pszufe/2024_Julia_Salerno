using Genie

using Genie.Renderer.Json

# Define a method that adds two numbers


route("/add", method = POST) do
    num1 = params(:num1, "0")
    num2 = params(:num2, "0")
    summ = parse(Int,num1) + parse(Int,num2)
    # return a JSON response
    ("result" => summ) |> json
end

up(8888)

# Run this script in the terminal with the following command:
# julia genie_webservice.jl

# Then, open a new terminal window and run the following command:
# curl -X POST -d "num1=5&num2=10" http://127.0.0.1:8888/add
