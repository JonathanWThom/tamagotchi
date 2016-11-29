class Tamagotchi
  define_method(:initialize) do |name, species|
    @name = name
    @species = species
    @food = 10
    @rest = 10
    @love = 10
    @poop = 0
  end
  define_method(:name) do
    @name
  end
  define_method(:species) do
    @species
  end
  define_method(:food) do
    @food
  end
  define_method(:rest) do
    @rest
  end
  define_method(:love) do
    @love
  end
  define_method(:poop) do
    @poop
  end
  define_method(:is_alive) do
    @food > 0 and @rest > 0 and @love > 0 and @poop < 10
  end
  define_method(:set_food) do |level|
    @food = level
  end
end
