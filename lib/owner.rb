require 'pry'
class Owner
  
  attr_reader :name, :species
  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
     "I am a #{species}."
  end

  def cats
    Cat.all.find_all do |cat|
      cat.owner == self
  end
end

def dogs
  Dog.all.find_all do |dog|
    dog.owner == self
  end
end

def buy_cat(name)
  Cat.new(name,self)
   
end

def buy_dog(name)
  Dog.new(name,self)
end

def walk_dogs
  dogs.each{|d| d.mood = "happy"}
end

def feed_cats
  cats.each{|c| c.mood = "happy"}
end

def pets
  pets = []
  pets << dogs
  pets << cats
  pets.flatten
end

def sell_pets
  pets.each do |p|
    p.mood = "nervous"
    p.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end

end