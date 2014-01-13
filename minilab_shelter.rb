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

def client_names
	client_names = []
	@clients.each { |x| client_names << x.name }
	return client_names
end

	def list_animals
		if @pets == []
			puts "PHEW!\n There aren't any animals in this wretched place."
		else
			p @pets
		end
	end

def client_from_name(name)
	@clients[client_name.index(name)]
end

end