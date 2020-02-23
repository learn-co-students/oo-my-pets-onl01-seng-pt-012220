class Owner
  # code goes here
  attr_reader :name, :species, :cats 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @cats = cats
    @species = "human"
    @@all << self
  end 
  
  def self.all 
    @@all 
  end
  
  def say_species
    "I am a human."
  end
  
  def self.count 
    self.all.count
  end
  
  def self.reset_all
    self.all.clear
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
  
  def pets 
    # pets = []
    # pets << dogs 
    # pets << cats
    # pets.flatten
    dogs + cats
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