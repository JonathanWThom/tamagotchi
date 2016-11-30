require('rspec')
require('tamagotchi')
require('pry-nav')

describe(Tamagotchi) do
  before() do
    Tamagotchi.clear
  end
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

  describe("#save") do
    it("adds a tamagotchi to the array of tamagotchis") do
      new_pet = Tamagotchi.new('Marvin', 'Martian')
      new_pet.save()
      expect(Tamagotchi.all()).to(eq([new_pet]))
    end
  end
  describe('.clear') do
    it('empties the tamagotchi array') do
      Tamagotchi.new('Marvin', "Martian").save()
      Tamagotchi.clear()
      expect(Tamagotchi.all()).to(eq([]))
    end
  end
  describe('#id') do
    it('returns the id of the pet') do
      new_pet = Tamagotchi.new('Marvin', "Martian")
      new_pet.save()
      expect(new_pet.id()).to(eq(1))
    end
  end
  describe('.find') do
    it('it will return a tomagotchi based on its id') do
      new_pet = Tamagotchi.new('Marvin', "Martian")
      new_pet.save()
      another_pet = Tamagotchi.new('Bob', "Moonian")
      another_pet.save()
      expect(Tamagotchi.find(new_pet.id())).to(eq(new_pet))
    end
  end
end
