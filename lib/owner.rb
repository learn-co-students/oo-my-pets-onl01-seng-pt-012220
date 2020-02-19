require 'pry'

class Owner
  
  attr_reader :name

  @@owner = []

  def initialize(name)
    @name = name
    @species = species
    @@owner << self
  end
  
  def species
    @species = "human"
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  #association code
  
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name_of_cat)
    Cat.new(name_of_cat, self)
  end
  
  def buy_dog(name_of_dog)
    Dog.new(name_of_dog, self)
  end
  
    #method Code
  
  def self.all
    @@owner
  end
  
  def self.count
    @@owner.count
  end
  
  def self.reset_all
    @@owner.clear
  end 
 
end