require './minilab_animal.rb'
require './minilab_client.rb'
require './minilab_shelter.rb'

happytails = Shelter.new("Happy Tails Shelter")
happytails.pets << Animal.new("Foo", 2, "male", "dog", ["ball", "bone", "rope"])
happytails.pets << Animal.new("Cindy", 3, "female", "cat")
happytails.clients << Client.new("John", 43, 2, 0)
happytails.clients << Client.new("Franco", 50, 0, 5)

def menu message
	puts `clear`

	puts

	puts "#{message}\n\n" unless message.empty?

	puts ">>>Happy Tails Shelter<<<"
	puts
	puts " ----- Version 1.0 ----- "

	puts "*************************"
	puts "* 1 : Create an animal  *"
	puts "* 2 : Create a client   *"
	puts "* 3 : List animals      *"
	puts "* 4 : List clients      *"
	puts "* 5 : Adoption          *"
	puts "* 6 : Aanimal Take-In   *"
	puts "* q : QUIT              *"
	puts "*************************"
	puts 
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
			message += "#{x.name}: #{x.species}, #{x.gender}, #{x.age}yo\n"
		end

	when "4"
		happytails.clients.each do |x|
			message += "#{x.name}, #{x.age}, #{x.num_of_children} children, #{x.num_of_pets} pets\n"
		end
	
	when "5"
		puts "A client wants to adopt a pet?!\nThat's AWESOME!!!"
		puts "First we'll see if they are in our database of clients already..."
		puts "What is the client's name?"
		name = gets.chomp
		if happytails.client_names.include?(name)
			puts "I see here we have #{name} in our system."
			puts "We have:\nClient Age: #{happytails.client_from_name(name).age} years old\nNo. of Children: #{happytails.client_from_name(name).num_of_children}\nNo. of Pets: #{happytails.client_from_name(name).num_of_pets}"
			puts "What animal would #{name} like to adopt?"
			happytails.pets.each {|x| p x.name}
			choice = gets.chomp
			happytails.pets.delete_if { |x| x.name == choice }
			happytails.client_from_name(name).adopt_a_pet
			message += "#{name} has just adopted #{choice}!\nHOW EXCITING!!!"		
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
			puts "What animal would #{name} like to adopt?"
			happytails.pets.each {|x| p x.name}
			choice = gets.chomp
			happytails.pets.delete_if { |x| x.name == choice }
			happytails.client_from_name(name).adopt_a_pet
			message += "#{name} has just adopted #{choice}!\nHOW EXCITING!!!!"
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
		puts "So we have #{name_animal} the #{gender} #{species} being added to the database..."
		new_animal = Animal.new(name_animal, age_animal, gender, species, toys)
		happytails.pets << new_animal
		puts "\n\nNow we need some information from our new client..."
		puts "Client name: "
		name_client = gets.chomp
		if happytails.client_names.include?(name_client)
			puts "I see here we have #{name} in our system."
			puts "We have:\nClient Age: #{happytails.client_from_name(name_client).age} years old\nNo. of Children: #{happytails.client_from_name(name_client).num_of_children}\nNo. of Pets: #{happytails.client_from_name(name_client).num_of_pets}"
			happytails.client_from_name(name_client).put_up_for_adoption
			message += "It looks like #{name_client} is in the system already.  Great!\n#{name_animal} is now a new member of the Happy Tree Family!\n"
		else
			puts "It looks like #{name_client} is not in our database.\nLet's add them shall we..."
			puts "Client age: "
			age_client = gets.chomp.to_i
			puts "Number of children: "
			num_of_chldren = gets.chomp.to_i
			puts "Number of current pets (include #{name_animal}): "
			num_of_pets = gets.chomp.to_i
			new_client = Client.new(name_client, age_client, num_of_chldren, num_of_pets)
			happytails.client_from_name(name_client).put_up_for_adoption
			message += "We've now added #{name_client} to our database.\n"
		end
		message += "Thank you!  We hope to find #{name_animal} a good home!"



	else
		message += "ERROR!  ERROR!  Incorrect input!!"
	end

	choice = menu message
end