class Owner
  attr_accessor :owner 
  attr_reader :name, :species, :my_cats, :my_dogs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human" 
    @@all << self 
    @my_cats = []
    @my_dogs = []
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def self.all 
    @@all
  end
  
  def self.count
    @@all.size 
  end
  
  def self.reset_all
    @@all = []
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    my_cats << Cat.new(name,self)
  end
  
  def buy_dog(name)
    my_dogs << Dog.new(name,self)
  end
  
  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    self.cats.map do |cat|
      cat.owner = nil 
      cat.mood = "nervous"
    end
      self.dogs.map do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
  end
  
  def list_pets
   return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
      
    
end