require('rspec')
require('tamagotchi')

describe(Tamagotchi) do
  describe('#initialize') do
    it('will set name and baseline levels for new pet') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      expect(my_pet.species()).to(eq('Griffin'))
      expect(my_pet.name()).to(eq('Lil Guy'))
      expect(my_pet.food()).to(eq(10))
      expect(my_pet.rest()).to(eq(10))
      expect(my_pet.love()).to(eq(10))
      expect(my_pet.poop()).to(eq(0))
    end
  end
  describe('#is_alive') do
    it('returns true if the Tamagotchi is still living') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      expect(my_pet.is_alive()).to(eq(true))
    end
    it('returns false if the Tamagotchi is dead') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      my_pet.set_food(0)
      expect(my_pet.is_alive()).to(eq(false))
    end
  end
  describe('#time_passes') do
    it('changes the amount of resources as time passes') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      my_pet.tamagotchi_changes(1)
      expect(my_pet.food()).to(eq(9))
      expect(my_pet.rest()).to(eq(9))
      expect(my_pet.love()).to(eq(9.5))
      expect(my_pet.poop()).to(eq(2))
      expect(my_pet.is_alive()).to(eq(true))
    end
  end
  describe('#feed') do
    it('increments food by 1') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      my_pet.feed()
      expect(my_pet.food()).to(eq(11))
    end
  end
  describe('#nap') do
    it('increments rest by 1') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      my_pet.nap()
      expect(my_pet.rest()).to(eq(11))
    end
  end
  describe('#pet') do
    it('increments food by 1') do
      my_pet = Tamagotchi.new('Lil Guy', 'Griffin')
      my_pet.pet()
      expect(my_pet.love()).to(eq(11))
    end
  end
end
