require 'rest-client'
require 'json'
require 'pry'

#require_relative "../bin/run.rb"

def get_character_from_user
  puts "What character's do you want to search"
  character = gets.chomp
end

def get_character_movies_from_api(character)
      if does_character_exist(character) != nil
       extant_character = does_character_exist(character)
          character_films = extant_character["films"]
              
          # character_films = character_films.flatten
          puts character_films
      else
        puts "We're sorry, but #{character}, is either from another 'universe', or not properly formatted."
        puts "care to try again?"
        run_program

      end
end
  # iterate over the character hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

def parse_character_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

def does_character_exist(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash['results'].find {|actual_character| actual_character["name"]==character}


end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
