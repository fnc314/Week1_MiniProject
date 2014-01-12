class Client

	attr_accessor :name, :num_of_children, :num_of_pets, :age

	def initialize(name, age, num_of_children, num_of_pets)
		@name = name
		@age = age
		@num_of_children = num_of_children
		@num_of_pets = num_of_pets
	end

	def adopt_a_pet
		@num_of_pets +=1
	end

	def put_up_for_adoption
		@num_of_pets -= 1
	end

end