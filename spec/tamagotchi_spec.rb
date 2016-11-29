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
end
