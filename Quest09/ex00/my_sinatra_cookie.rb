require "sinatra"
require "json"

set :bind ,"0.0.0.0"
set :port , 8080


get "/" do
    
    action,name,value= params[:action],params[:name],params[:value]

    case action
    when "set"
        response.set_cookie(name, value)
        "cookie has been set"
    when "get"
        "cookies has a value of : #{request.cookies[name]}."
    when "del"
        response.delete_cookie name       
    else 
        request.cookies
    end

 end
#query params
 #http://localhost:8080/?action=del&name=user_id&value=RX456785678