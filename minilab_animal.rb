class Animal

	attr_accessor :name, :age, :gender, :species, :toys

	def initialize(name, age, gender, species, toys=[])
		@name = name
		@age = age
		@gender = gender
		@species = species
		@toys = toys
	end

end