class Owner
   attr_reader :name, :species
   @@all = []
   def initialize(name)
     @name = name
     @species = "human" 
     @@all << self
   end 
 
   
   def self.all 
     @@all 
   end 
   
   def self.count 
     self.all.count
   end 
   
   def self.reset_all 
     self.all.clear
   end 
   
   def say_species
     "I am a #{species}."
   end 
   
   def cats 
     Cat.all.select {|x| x.owner == self} 
   end 
   
   def dogs 
     Dog.all.select {|x| x.owner == self} 
   end 
   
   def buy_cat(name)
     Cat.new(name, self)
   end 
   
   def buy_dog(name)
     Dog.new(name, self)
   end 
   
   def walk_dogs 
     dogs.each do |d|
       d.mood = "happy"
     end
   end 
     
  def feed_cats 
    cats.each do |c| 
      c.mood = "happy"
    end 
   end 
   
   def pets
     pets = dogs + cats 
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