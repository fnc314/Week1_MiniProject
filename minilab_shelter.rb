class Shelter

	attr_reader :name, :pets, :clients

	def initialize(name, pets = [], clients = [])
		@name = name
		@pets = [] #intances of animal class
	  @clients = [] #instances of client class
	end

	def take_in(animal)
	  if animal.is_a?(Animal)
	  	@pets << animal
	  else
	  	puts "#{animal} is not a valid animal."
	  end
	end

	def add_client(client)
		if client.is_a?(Client)
			@clients << client
		else
			puts "I don't believe #{client} is a real person."
		end
	end

	def access_client(name)
			client_names = []
			@clients.each {|x| client_names << x.name}
			if client_names.include(name)
				return true
			else
				return false
			end
		end
	end

	def list_animals
		if @pets == []
			puts "PHEW!\n There aren't any animals in this wretched place."
		else
			p @pets
		end
	end

end