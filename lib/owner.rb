require 'pry'

class Owner
   
   attr_reader :name, :species
  
 
 @@all = []
 @@counter = 0
 
 def initialize(name)
   @name = name
   @species = "human"
   @@all << self
   @@counter += 1 
 end
 
 def say_species
   "I am a #{species}."
 end
 
 def cats
   Cat.all.select {|c| c.owner == self}
 end
 
 def dogs
   Dog.all.select {|d| d.owner == self}
 end
 
 def buy_cat(name)
   Cat.new(name,self)
 end
 
 def buy_dog(name)
   Dog.new(name,self)
 end
 
 def walk_dogs
   dogs.each {|d| d.mood = "happy"}
 end
 
 def feed_cats
   cats.each {|c| c.mood = "happy"}
 end
 
 def sell_pets
   dogs.each {|d| d.mood = "nervous"}
   cats.each {|c| c.mood = "nervous"  }
   dogs.each {|d| d.owner = nil}
   cats.each {|c| c.owner = nil}
 end
 
 def list_pets
   "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
 end
 
 def self.all
   @@all
 end
 
 def self.count
   @@counter
 end
 
 def self.reset_all
   @@all.clear
   @@counter = 0
 end
 
end