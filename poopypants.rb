require 'rubygems'
require 'sinatra'

get '/' do
  @og_description = "Professor Poopypants's Name 'Change-O-Chart 2000' is your one-stop shop for wacky new names!"
  erb :index
end

post '/' do
  first = request.POST['first'].gsub(/\W+|\d+|_/, '')
  last = request.POST['last'].gsub(/\W+|\d+|_/, '')

  if first.empty? || last.empty?
    redirect to("/?moron=true")
  else
    redirect to("/#{first.capitalize}/#{last.capitalize}")
  end
end

get '/about/?' do
  @subtitle = "About - "
  erb :about
end

get '/:first/?' do
  redirect to("/")
end

get '/:first/:last/?' do

  @first = params[:first].gsub(/\W+|\d+|_/, '')
  @last  = params[:last].gsub(/\W+|\d+|_/, '')

  if @first.empty? || @last.empty?
    redirect to("/")
  else
    firsts  = {"A" => "Stinky", "B" => "Lumpy", "C" => "Buttercup", "D" => "Gidget", "E" => "Crusty", "F" => "Greasy", "G" => "Fluffy", "H" => "Cheeseball", "I" => "Chim-Chim", "J" => "Poopsie", "K" => "Flunky", "L" => "Booger", "M" => "Pinky", "N" => "Zippy", "O" => "Goober", "P" => "Doofus", "Q" => "Slimy", "R" => "Loopy", "S" => "Snotty", "T" => "Falafel", "U" => "Dorky", "V" => "Squeezit", "W" => "Oprah", "X" => "Skipper", "Y" => "Dinky", "Z" => "Zsa-Zsa"}
    middles = {"A" => "Diaper", "B" => "Toilet", "C" => "Giggle", "D" => "Bubble", "E" => "Girdle", "F" => "Barf", "G" => "Lizard", "H" => "Waffle", "I" => "Cootie", "J" => "Monkey", "K" => "Potty", "L" => "Liver", "M" => "Banana", "N" => "Rhino", "O" => "Burger", "P" => "Hamster", "Q" => "Toad", "R" => "Gizzard", "S" => "Pizza", "T" => "Gerbil", "U" => "Chicken", "V" => "Pickle", "W" => "Chuckle", "X" => "Tofu", "Y" => "Gorilla", "Z" => "Stinker"}
    lasts   = {"A" => "head", "B" => "mouth", "C" => "face", "D" => "nose", "E" => "tush", "F" => "breath", "G" => "pants", "H" => "shorts", "I" => "lips", "J" => "honker", "K" => "butt", "L" => "brain", "M" => "tushie", "N" => "chunks", "O" => "hiney", "P" => "biscuits", "Q" => "toes", "R" => "buns", "S" => "fanny", "T" => "sniffer", "U" => "sprinkles", "V" => "kisser", "W" => "squirt", "X" => "humperdinck", "Y" => "brains", "Z" => "juice"}

    @new_first   = firsts["#{@first[0].upcase}"]
    @new_middle  = middles["#{@last[0].upcase}"]
    @new_last    = lasts["#{@last[-1].upcase}"]

    @subtitle = "#{@first.capitalize} #{@last.capitalize} - "
    @og_description = "According to Professor Poopypants's Name 'Change-O-Chart 2000', #{@first.capitalize} #{@last.capitalize}'s wacky new name is #{@new_first} #{@new_middle}#{@new_last}!"
    erb :poopypants
  end

end