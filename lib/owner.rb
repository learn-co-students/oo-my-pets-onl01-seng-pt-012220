class Owner
    attr_reader :name, :species 

    @@all = [] 

    def initialize(name)
        @name = name 
        @species = "human"
        @@all << self 
    end 

    def species
        @species
    end 

    def say_species 
        "I am a #{species}."
    end 

    def self.all
        @@all
    end

    def self.count
        self.all.count 
    end 

    def self.reset_all
        @@all.clear 
    end 

    def cats
      Cat.all.select {|meow| meow.owner == self} 
    end 

    def dogs
        Dog.all.select {|bark| bark.owner == self} 
    end 

    def buy_cat(name)
        Cat.new(name,self)
    end 

    def buy_dog(name)
        Dog.new(name,self)
    end 

    def walk_dogs  
        dogs.map {|ruff| ruff.mood = "happy"}
    end 

    def feed_cats 
        cats.map {|purr| purr.mood = "happy"}
    end 

    def sell_pets
        dogs.map {|seller| seller.mood = "nervous"}
        cats.map {|seller_2| seller_2.mood = "nervous"}
        dogs.map {|seller_3| seller_3.owner = nil}
        cats.map {|seller_4| seller_4.owner = nil}
    end 

    def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end 
end 