using HTTP

# Define a request handler function
function request_handler(req::HTTP.Request)
    @show req
    if req.method == "GET"
        HTTP.Response(200, "Hello, this is a GET request!")
    elseif req.method == "POST"
        body = String(req.body)
        HTTP.Response(200, "Hello, this is a POST request with body: $body")
    else
        HTTP.Response(405, "Method Not Allowed")
    end
end


# Start the server
HTTP.serve(request_handler, "127.0.0.1", 8080)

# Run this script in the terminal with the following command:
# julia http_jl_webservice.jl

# Then, open a new terminal window and run the following command:
# curl -X POST -d "test body" http://127.0.0.1:8080