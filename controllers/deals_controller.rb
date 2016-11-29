require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/deal.rb' )
require_relative( '../models/burger.rb' )
require_relative( '../models/day.rb' )
require_relative( '../models/restaurant.rb' )
require_relative( '../models/restaurant_deal.rb')

get '/deals' do
  @deals = Deal.all
  erb ( :"deals/index" )
end

get '/deals/new' do
  @restaurants = Restaurant.all
  @days = Day.all
  @deals = Deal.all
  erb(:"deals/new")
end

get '/deals/:id' do
  @restaurants = Restaurant.all()
  @deal = Deal.find( params[:id] )
  erb(:"deals/show")
end

post '/deals' do
  deal = Deal.new(params)
  deal.save
  redirect to("/deals")
end

post '/deals/:id/delete' do
  Deal.destroy( params[:id])
  redirect to("/deals") 
end