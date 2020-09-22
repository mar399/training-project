require "sinatra"


set :bind ,"0.0.0.0"
set :port , 8080
 


configure do
  enable :sessions
end


# configure do
#     :session_secret , "abcde"
# end

    before do
        content_type :txt
    end

get "/" do
    action,name,value= params[:action],params[:name],params[:value]

    case action
    when "set"
       session[:name] = name
        "Session has been set"

    when "get"
        "Session has a value of : #{session[:name]}."

    when "del"
        session.delete(:name)
    # else 
    #     request.cookies
    end

 end




