require 'pry'

class Owner

  @@all = [] #array
  

  attr_accessor :mood 
  attr_reader :species, :name 

  def initialize(name) 
    @name = name
    @species = "human"
    @@all << self 
    

  end 

  def self.all 
    @@all 
  end 

  def say_species 
    "I am a #{self.species}."
  end 
  
  def self.count
    @@all.count
  end 

  def self.reset_all 
    @@all = []
  end 

def cats 
  Cat.all.select do |cat|
    cat.owner == self
  end  
end 

def dogs
  Dog.all.select do |dog|
    dog.owner == self 
  end 
end 

  def buy_cat(name)
   Cat.new(name, self)
   
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs 
      dogs.each do |dog|
        dog.mood = 'happy'
      end
  end 

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end 

  def sell_pets
    scared_dogs = self.dogs
    scared_dogs.each {|dog| dog.mood = "nervous"}

    scared_cats = self.cats
    scared_cats.each {|cat| cat.mood = "nervous"}

    scared_dogs.each {|dog| dog.owner = nil}
    scared_cats.each {|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."

  end 
end

  




