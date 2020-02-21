class Owner
 
  @@all=[]
  
  attr_reader   :name,:species 
  attr_accessor :dogs, :cats 
  
  def initialize(name,species ="human")
    @name=name
    @species = species
    @@all << self 
    @dogs=[]
    @cats=[]
  end 
  
   
  def say_species 
   return "I am a #{@species}."
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
   Cat.all.select{|cat| cat.owner==self}
  end 
  
  def dogs
   Dog.all.select{|dog| dog.owner==self}
  end 
  
  def buy_cat(name) 
    cat = Cat.new(name,self)
     @cats << cat
   
  end 

  def buy_dog(name)
    dog = Dog.new(name,self)
     @dogs << dog
    end 

   def walk_dogs
    Dog.all.each do |dog|
      dog.mood = 'happy'
    end
   end 

  def feed_cats
  Cat.all.each do |cat|
      cat.mood = 'happy'
    end
end 
 
  def sell_pets
   
  Cat.all.drop_while do |cat|
    
   (cat.owner=nil)||(cat.mood="nervous") 
  
  end 
  
  Dog.all.drop_while do |dog|
    
    (dog.owner=nil)||(dog.mood="nervous")
  
    end 
    
	end 
  
 
 def list_pets
     "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
     #"I have #{Dog.all.length} dog(s), and #{Cat.all.length} cat(s)."
 end 

end