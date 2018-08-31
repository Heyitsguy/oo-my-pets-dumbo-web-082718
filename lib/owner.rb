class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all_owners = []

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.count
  end

  def self.reset_all
    @@all_owners.clear
  end

  def initialize(species=nil, pets={:fishes => [], :dogs => [], :cats => []})
    @species = species
    @@all_owners.push(self)
    @pets = pets
  end

  def self.species
    self.new(species)
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes].push(new_fish)
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats].push(new_cat)
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs].push(new_dog)
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |pet, pet_arr|
      pet_arr.each do |pet|
        pet.mood="nervous"
      end
      pet_arr.clear
    end
  end

  def list_pets
    arr=[]
    self.pets.each do |pet, pet_arr|
      num = pet_arr.length
      arr.push(num.to_s)
    end
    "I have " + arr[0].concat(" fish, ") + arr[1].concat(" dog(s), ") + "and "+ arr[2].concat(" cat(s).")
  end

end
