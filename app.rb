require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  @all_tamagotchis = Tamagotchi.all()
  erb(:index)
end

post('/output') do

  @name = params.fetch('pet_name')
  @species = params.fetch('species')
  if @new_pet.eql?(nil)
    @new_pet = Tamagotchi.new(@name, @species)
    @new_pet.save()
    erb(:output)
  end
end

@new_pet = ""
post('/interaction') do
  interaction = params.fetch('interactions')
   @all_tamagotchis = Tamagotchi.all()
  if interaction == 'feed'
    @all_tamagotchis[0].feed()
  elsif interaction == 'pet'
    @all_tamagotchis[0].pet()
  elsif interaction == 'nap'
    @all_tamagotchis[0].nap()
  elsif interaction == 'clean'
    @all_tamagotchis[0].clean()
  end
  erb(:interaction)
end
