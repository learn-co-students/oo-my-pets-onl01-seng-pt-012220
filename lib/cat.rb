require 'pry'

class Cat
  # code goes here
  
  attr_accessor :owner, :mood
  attr_reader :name
  
  @@all = []
  
  def initialize(name,owner)
    
    @owner = owner 
    @name = name
    @@all << self
    @mood = "nervous"
  
  end 
  
  def self.all 
    @@all 
  end
  
  
end