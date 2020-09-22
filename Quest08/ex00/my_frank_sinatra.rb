require "sinatra"
set :port,8080
set :bind,'0.0.0.0'

  get '/' do
    arr=[
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
#rand will return from 0-19 if we call rand(20)
   return arr[rand(arr.length)]
   #or return arr[rand(20)]
   #or better yet use arr.sample

  end