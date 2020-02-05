require 'pry'
class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
   "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|c| c.owner == self}
  end

  def dogs
    Dog.all.select{|d| d.owner == self}
  end

  def buy_cat(cat_name)
    new_c = Cat.new(cat_name, self)
    new_c
  end
  
  def buy_dog(dog_name)
    new_d = Dog.new(dog_name, self)
    new_d
  end

  def walk_dogs
    self.dogs.each{|d| d.mood = "happy"} 
  end
  def feed_cats
    self.cats.each{|c| c.mood = "happy"} 
  end
  
  def sell_pets
    self.dogs.each{|d| d.owner = nil; d.mood = "nervous"} 
    self.cats.each{|c| c.owner = nil; c.mood = "nervous"} 
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end