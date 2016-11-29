require 'Capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  it('allows the user to create a new tamagotchi') do
    visit('/')
    fill_in('name', :with => 'Marvin')
    select('Martian', :from => 'species')
    click_button('Create')
    expect(page).to have_content('You have created Marvin the Martian')
  end
end

describe('the interacting with pet path', {:type => :feature}) do
  it('allows the user to interact with their pet and displays changes') do
    visit('/')
    fill_in('name', :with => 'Marvin')
    select('Martian', :from => 'species')
    click_button('Create')

    visit('/output')
    select('Feed', :from => 'interactions')
    click_button('Go')
    expect(page).to have_content('You did something to your pet. Nice work!')
  end
end
