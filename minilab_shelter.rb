class Shelter

	attr_reader :name, 

	def initialize(name)
		@name = name
		@pets = [] #of hashes
	  @client = [] #of hashes
	end

end