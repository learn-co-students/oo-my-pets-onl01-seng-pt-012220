class Owner
 attr_reader :name, :species
 
   @@all = []

 def initialize (name)
   @name = name
   @species = "human"
   @@all << self
 end

 def say_species
   "I am a #{species}."
 end
 
 def self.all
   @@all
 end
 
 

 def self.count
   @@all.length
 end
 
 def self.reset_all
   @@all.clear
 end
 
 def cats 
   Cat.all.select {|c| c.owner == self}
 end

 def dogs 
   Dog.all.select {|d| d.owner == self}
 end
 
 def buy_cat(cat_name)
   Cat.new(cat_name, self)
 end
 
 def buy_dog(dog_name)
   Dog.new(dog_name, self)
 end
 
 def walk_dogs
   dogs.each {|d| d.mood = "happy"}
 end
 
 def feed_cats
  cats.each {|c| c.mood = "happy"}
 end
 
 def sell_pets
   pets = dogs + cats
   pets.each {|p| p.mood = "nervous"}
   pets.each {|p| p.owner = nil}
 end
 
 def list_pets
   "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
 end
 
end