class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.size
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def set_mood_to_pets(pet_collection, new_mood)
    pet_collection.each { |pet| pet.mood = new_mood }
  end

  def walk_dogs
    set_mood_to_pets(self.dogs, "happy")
  end

  def feed_cats
    set_mood_to_pets(self.cats, "happy")
  end

  def sell_pets
    set_mood_to_pets(self.dogs, "nervous")
    set_mood_to_pets(self.cats, "nervous")

    self.dogs.each { |dog| dog.owner = nil }
    self.cats.each { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end