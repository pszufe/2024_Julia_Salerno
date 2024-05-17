using HTTP
using JSON3

# Define a request handler function
function request_handler(req::HTTP.Request)
    if req.method == "GET"
        body = String(req.body)
        HTTP.Response(200, "Hello, this is a GET request! for body: $body")
    elseif req.method == "POST"
        body = String(req.body)
        dat = JSON3.read(body)
        res = dat["num1"] + dat["num2"]
        HTTP.Response(200, ["Content-Type" => "application/json"], JSON3.write(:res => res))
    else
        HTTP.Response(405, "Method Not Allowed")
    end
end


# Start the server
HTTP.serve(request_handler, "127.0.0.1", 8080)

# Run this script in the terminal with the following command:
# julia http_jl_webservice.jl

# Then, open a new terminal window and run the following command:
# curl -s -X GET -d "some test body" http://127.0.0.1:8080

# or

# curl -s -X POST -H "Content-Type: application/json" -d "{\"num1\":3, \"num2\":440}" http://127.0.0.1:8080