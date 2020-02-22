class Owner
 
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    Dog.all.each { |dog| dog.mood = 'happy' if dog.owner == self }
  end

  def feed_cats
    Cat.all.each { |cat| cat.mood = 'happy' if cat.owner == self }
  end

  def sell_pets
    Dog.all.each do |dog| 
      if dog.owner == self 
        dog.mood = 'nervous'
        dog.owner = nil
      end
    end

    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = 'nervous'
        cat.owner = nil
      end
    end
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
end