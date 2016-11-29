class Tamagotchi
  define_method(:initialize) do |name, species|
    @name = name
    @species = species
    @food = 10
    @rest = 10
    @love = 10
    @poop = 0
    @start_time = Time.new()
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
  define_method(:time_passes) do
    right_now = Time.new()
    if right_now.sec - @start_time.sec == 0
      @food -= 1
      puts "works"
    end
  end
end
