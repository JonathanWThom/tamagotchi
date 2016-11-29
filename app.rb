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
  new_pet = Tamagotchi.new(@name, @species)
  erb(:output)
end
