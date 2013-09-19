require 'rubygems'
require 'sinatra'

get '/' do
  erb :index
end

get '/:first/:last' do

  ### PROFESSOR POOPYPANTS NAME CHANGE-O-RUBY-SCRIPT 2000 ###

  firsts = [["A", "Stinky"], ["B", "Lumpy"], ["C", "Buttercup"], ["D", "Gidget"], ["E", "Crusty"], ["F", "Greasy"], ["G", "Fluffy"], ["H", "Cheeseball"], ["I", "Chim-Chim"], ["J", "Poopsie"], ["K", "Flunky"], ["L", "Booger"], ["M", "Pinky"], ["N", "Zippy"], ["O", "Goober"], ["P", "Doofus"], ["Q", "Slimy"], ["R", "Loopy"], ["S", "Snotty"], ["T", "Falafel"], ["U", "Dorky"], ["V", "Squeezit"], ["W", "Oprah"], ["X", "Skipper"], ["Y", "Dinky"], ["Z", "Zsa-Zsa"]]
  middles  = [["A", "Diaper"], ["B", "Toilet"], ["C", "Giggle"], ["D", "Bubble"], ["E", "Girdle"], ["F", "Barf"], ["G", "Lizard"], ["H", "Waffle"], ["I", "Cootie"], ["J", "Monkey"], ["K", "Potty"], ["L", "Liver"], ["M", "Banana"], ["N", "Rhino"], ["O", "Burger"], ["P", "Hamster"], ["Q", "Toad"], ["R", "Gizzard"], ["S", "Pizza"], ["T", "Gerbil"], ["U", "Chicken"], ["V", "Pickle"], ["W", "Chuckle"], ["X", "Tofu"], ["Y", "Gorilla"], ["Z", "Stinker"]]
  lasts   = [["A", "Head"], ["B", "Mouth"], ["C", "Face"], ["D", "Nose"], ["E", "Tush"], ["F", "Breath"], ["G", "Pants"], ["H", "Shorts"], ["I", "Lips"], ["J", "Honker"], ["K", "Butt"], ["L", "Brain"], ["M", "Tushie"], ["N", "Chunks"], ["O", "Hiney"], ["P", "Biscuits"], ["Q", "Toes"], ["R", "Buns"], ["S", "Fanny"], ["T", "Sniffer"], ["U", "Sprinkles"], ["V", "Kisser"], ["W", "Squirt"], ["X", "Humperdinck"], ["Y", "Brains"], ["Z", "Juice"]]

  first = params[:first].gsub("+", " ").capitalize
  last = params[:last].gsub("+", " ").capitalize

  first_first_letter = first.gsub(/\W+|\d+/, '')[0].chr.capitalize
  last_first_letter  = last.gsub(/\W+|\d+/, '')[0].chr.capitalize
  last_last_letter   = last.gsub(/\W+|\d+/, '')[-1].chr.capitalize

  new_first = firsts.select{|f| f[0] == first_first_letter}[0][1]
  new_middle  = middles.select{|f| f[0]  == last_first_letter}[0][1]
  new_last   = lasts.select{|f| f[0]   == last_last_letter}[0][1]

  erb :poopypants, :locals => { :first => first, :last => last, :new_first => new_first, :new_middle => new_middle, :new_last => new_last }

end