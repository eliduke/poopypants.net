require 'sinatra'
require 'poopypants'

use Rack::Protection::HostAuthorization, permitted_hosts: ["localhost", "poopypants.net"]

get '/' do
  @og_title = "Professor Poopypants 'Name Change-O-Chart 2000'"
  @og_description = "Professor Poopypants's Name 'Change-O-Chart 2000' is your one-stop shop for wacky new names!"
  erb :index
end

post '/' do
  first = request.POST['first'].strip
  last = request.POST['last'].strip

  redirect to("/#{first}/#{last}")
end

get '/about/?' do
  @og_title = "About - Professor Poopypants 'Name Change-O-Chart 2000'"
  erb :about
end

get '/:first/?' do
  redirect to("/")
end

get '/:first/:last/?' do

  first = params[:first]
  last  = params[:last]

  # contains numbers?
  if (first + last) =~ /\d/
    redirect to("/")
  else
    name = Poopypants::Name.new(first, last)

    @full_name = "#{first} #{last}"
    @new_name = name.poopify

    @og_title = "#{@full_name} is #{@new_name}"
    @og_description = "According to Professor Poopypants, #{@full_name}'s wacky new name is #{@new_name}!"

    erb :poopypants
  end

end
