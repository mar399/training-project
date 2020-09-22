require "sinatra"



set :port,8080
set :bind,'0.0.0.0'

get '/' do
    arr = [
        'Ac-cent-tchu-ate the Positive',
        'Accidents Will Happen',
        'Adeste Fideles',
        'Ad-Lib Blues',
        'An Affair to Remember (Our Love Affair)',
        'After You have Gone',
        'Air For English Horn',
        'Alice Blue Gown',
        'All Alone',
        'All By Myself',
        'All I Do Is Dream of You',
        'All I Need is the Girl',
        'All My Tomorrows',
        'All of Me',
        'All of You',
        'All or Nothing at All',
        'All the Things You Are',
        'All the Way Home',
        'All Through the Day',
        'America the Beautiful'
    ]
    return arr[rand(20)]

end

get '/birth_date' do
    "December 12, 1915 "
end



    get '/birth_city' do
        "Hoboken, New Jersey"

    end

    get '/wives' do
       "Nancy Barbato <br>Ava Gardner <br>Mia Farrow <br>Barbara Max"
    end

    get '/picture' do
     erb(:pic)
    end

__END__
@@ layout
 <html>
  <head>
      <title>Image Page</title>
      <meta charset="utf-8"/>
  </head>
  <body><%= yield%></body>
 </html>

@@ pic
  <div>
   <img src="https://upload.wikimedia.org/wikipedia/commons/a/af/Frank_Sinatra_%2757.jpg">
  </div>

 
  
  
  
  
  
  