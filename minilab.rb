require './minilab_animal.rb'
require './minilab_client.rb'
require './minilab_shelter.rb'

happytails = Shelter.new("Happy Tails Shelter")
happytails.pets << Animal.new("Foo", 2, "male", "dog", ["ball", "bone", "rope"])
happytails.clients << Client.new("John", 43, 2, 0)
happytails.clients << Client.new("Franco", 50, 0, 0)

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
		happytails.pets << Animal.new(name, age, gender, species, toys)
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
		happytails.clients << Client.new(name, age, pets, children)
		message += "#{name} is now a new client of Happy Tails Shelter!  Welcome!"

	when "3"
		happytails.pets.each do |x|
			message += x.name + " "
		end

	when "4"
		happytails.clients.each do |x|
			message += x.name + " "
		end
	
	when "5"
		puts "A client wants to adopt a pet?!\nThat's AWESOME!!!"
		puts "First we'll see if they are in our database of clients already"
		puts "What is the client's name?"
		name = gets.chomp
		if happytails.client_names.include?(name)
			puts "I see here we have #{name} in our system."
			puts "Please verify the following:\n Client Age: #{name}.age \n No of Children: #{name}.num_of_chldren \n No of Pets: #{name}.num_of_pets"
			puts "What animal would #{name} like to adopt?"
			animal_name = gets.chomp
			puts "Let me check on that..."
			happytails.pets.each { |x| p x.name if x.name == animal_name }
		else 
			puts "It looks like #{name} is not in the system...let's add them..."
			print "Client name: #{name}\n"
			print "Client age:"
			age = gets.chomp.to_i
			print "Number of children:"
			children = gets.chomp.to_i
			print "Number of current pets:"
			pets = gets.chomp.to_i
			happytails.clients << Client.new(name, age, children, pets)
		end

	when "6"
		puts "How adorable!?!\nA new member of the Happy Tails Family!!"
		puts "Let's get this cutie in our database then...\nFirst a few questions:"
		puts "Animal name: "
		name_animal = gets.chomp
		puts "Animal age: "
		age_animal = gets.chomp.to_i
		puts "Animal gender: "
		gender = gets.chomp
		puts "Animal species: "
		species = gets.chomp
		puts "Any toys (EX: ball, bone, rope): "
		toys = gets.chomp.split(", ")
		puts "#{name} the #{gender} #{species} is being added to the database"
		new_animal = Animal.new(name_animal, age_animal, gender, species, toys)
		happytails.pets << new_animal
		puts "\n\n\nNow we need some information from our new client..."
		puts "Client name: "
		name_client = gets.chomp
		puts "Client age: "
		age_client = gets.chomp.to_i
		puts "Number of children: "
		num_of_chldren = gets.chomp.to_i
		puts "Number of current pets (not including #{name_animal} here): "
		num_of_pets = gets.chomp.to_i
		new_client = Client.new(name_client, age_client, num_of_chldren, num_of_pets)
		if happytails.clients.include?(new_client)
			message += "It looks like #{name_client} is in the system already.  Great!\n"
		else
			happytails.clients.push(new_client)
		end

		message += "Thank you!  We hope to find #{name_animal} a good home!"



	else
		message += "ERROR!  ERROR!  Incorrect input!!"
	end

	choice = menu message
end