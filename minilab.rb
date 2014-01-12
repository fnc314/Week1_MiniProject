require './minilab_animal.rb'
require './minilab_client.rb'
require './minilab_shelter.rb'
require 'pry'

HappyTails = Shelter.new("Happy Tails Shelter")
HappyTails.pets << Animal.new("Foo", 2, "male", "dog", ["ball", "bone", "rope"])
HappyTails.clients << Client.new("John", 43, 2, 0)

def menu message
	puts `clear`

	puts "#{message}\n\n" unless message.empty?

	puts "1 : Create an animal"
	puts "2 : Create a client"
	puts "3 : List animals"
	puts "4 : List clients"
	puts "5 : ADOPTION"
	puts "6 : ANIMAL TAKE-IN"
	puts "q : QUIT"
	print "-->"
	gets.chomp
end

message = ''
choice = menu message
while choice != 'q'
	message = ''
	case choice
	when "1"
		puts "Enter animal info:"
		print "Animal name:"
		name = gets.chomp
		print "Animal age:"
		age = gets.chomp.to_i
		print "Animal gender:"
		gender = gets.chomp
		print "Animal species:"
		species = gets.chomp
		print "Animal toys (EX:  ball, bone, rope):"
		toys = gets.chomp.split(", ")
		HappyTails.pets << Animal.new(name, age, gender, species, toys)
		message += "#{name} the #{gender} #{species} has been created!"

	when "2"
		puts "Enter client info:"
		print "Client name:"
		name = gets.chomp
		print "Client age:"
		age = gets.chomp.to_i
		print "Number of children:"
		children = gets.chomp.to_i
		print "Number of current pets:"
		pets = gets.chomp.to_i
		HappyTails.clients << Client.new(name, age, pets, children)
		message += "#{name} is now a new client of Happy Tails Shelter!  Welcome!"

	when "3"
		HappyTails.pets.each do |x|
			message += x.name + " "
		end

	when "4"
		HappyTails.clients.each do |x|
			message += x.name + " "
		end
	
	when "5"
		puts "A client wants to adopt a pet?!\nThat's AWESOME!!!"
		puts "First we'll see if they are in our database of clients already"
		puts "What is the client's name?"
		name = gets.chomp
		binding.pry
		if HappyTails.access_client(name)
			puts "I see we have #{name} in our system."
			puts "Please verify the following:\n Client Age: #{name}.age \n No of Children: #{name}.num_of_chldren \n No of Pets: #{name}.num_of_pets"
			puts "What animal would #{name} like to adopt?"
			animal_name = gets.chomp
			puts "Let me check on that..."
			HappyTails.pets.each { |x| p x.name if x.name == animal_name }
		#else 
			#puts "It looks like #{name} is not in the system...let's add them..."
			#print "Client name: #{name}\n"
			#print "Client age:"
			#age = gets.chomp.to_i
			#print "Number of children:"
			#children = gets.chomp.to_i
			#print "Number of current pets:"
			#pets = gets.chomp.to_i
			#HappyTails.clients << Client.new(name, age, pets, children)
		end

	else
		message += "ERROR!  ERROR!  Incorrect input!!"
	end

	choice = menu message
end