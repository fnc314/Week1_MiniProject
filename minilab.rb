require './minilab_animal.rb'
require './minilab_client.rb'
require './minilab_shelter.rb'

HappyTails = Shelter.new("Happy Tails Shelter")

def menu message
	puts 'clear'

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
			p x.name
		end

	when "4"
		HappyTails.clients.each do |x|
			p x.name
		end
	
	end

	choice = menu message
end