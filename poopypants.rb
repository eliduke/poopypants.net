require 'sinatra'
require 'poopypants'

get '/' do
  @og_title = "Professor Poopypants 'Name Change-O-Chart 2000'"
  @og_description = "Professor Poopypants's Name 'Change-O-Chart 2000' is your one-stop shop for wacky new names!"
  erb :index
end

post '/' do
  first = request.POST['first'].strip
  last = request.POST['last'].strip

  if first.empty? || last.empty?
    redirect to("/?moron=true")
  else
    redirect to("/#{first.capitalize}/#{last.capitalize}")
  end
end

get '/about/?' do
  @subtitle = "About -"
  erb :about
end

get '/:first/?' do
  redirect to("/")
end

get '/:first/:last/?' do

  @first = params[:first]
  @last  = params[:last]

  if @first.empty? || @last.empty?
    redirect to("/")
  else
    name = Poopypants::Name.new(@first, @last)

    @full_name = "#{name.first.capitalize} #{name.last.capitalize}"
    @new_name = name.poopify
    @subtitle = "#{@full_name} is #{@new_name} -"

    @og_title = @subtitle.split("-").first.strip
    @og_description = "According to Professor Poopypants' Name 'Change-O-Chart 2000', #{@full_name}'s WACKY NEW NAME is #{@new_name}!"

    erb :poopypants
  end

end
