require "sinatra"
set :bind ,"0.0.0.0"
set :port, 8084

get '/' do
    "Everybody can see this page"
end
#request params
get '/protected/:username/:password' do
  #on getting the value, the value will be pushed to the implicit hash. for example type Tasiu
  #Tasiu will be matched to the key :username and type barbecue as password, barbecue will be paired with the key :password
  if  params[:username]=="admin" && params[:password]=="password"
    return "Welcome, authenticated client"
  else 
    #unauthorized error is 401
    status = 401
    return "Not authorized"
  end
end

