require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')

get('/') do
  erb(:index)
end

post('/output') do
  @name = params.fetch('name')
  @species = params.fetch('species')
  @new_pet = Tamagotchi.new(@name, @species)

  if @new_pet
    interaction = params.fetch('interactions')
    if interaction == 'Feed'
      @new_pet.feed()
    elsif interaction == 'Pet'
      @new_pet.pet()
    elsif interaction == 'Nap'
      @new_pet.nap()
    elsif interaction == 'Clean'
      @new_pet.clean()
    end
    erb(:interaction)
  else
  end

  erb(:output)
end

post('/interaction') do
  interaction = params.fetch('interactions')
  # if interaction == 'Feed'
  #   @new_pet.feed()
  # elsif interaction == 'Pet'
  #   @new_pet.pet()
  # elsif interaction == 'Nap'
  #   @new_pet.nap()
  # elsif interaction == 'Clean'
  #   @new_pet.clean()
  # end
    erb(:interaction)
end
