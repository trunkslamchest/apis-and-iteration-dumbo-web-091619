require 'rest-client'
require 'json'
require 'pry'

def get_all_the_characters
  response_string = RestClient.get('https://swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  return response_hash["results"]
end

def find_character_from_api(character_name)

  characters = get_all_characters
  characters.find {|character| character["name"].downcase == character_name }

end

def take_film_urls_and_return_film_objects(film_urls)
  film_urls.map { |film_url|
    response_string = RestClient.get(film_url)
    return JSON.parse(response_string)
  }
end

def get_character_movies_from_api(character_name)

  character_object = find_character_from_api(character_name)
  films = character_oject["films"]
  film_objects = take_film_urls_and_return_film_objects(films)
  film_objects.sort {|film| film["episode_id"] }
end

def print_movies(films)
#  film_objects.map { |film| film["title"] }
end

# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   # print_movies(films)
#   # binding.pry
# end




# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#  val1 = response_hash.reduce([]) { |x, y|

#     x = y[1]

#   x
#   }

# arr1 = []

# val2 = val1.select {|e|

# if e["name"] == character_name

#     e["films"].select { |film_url|
#       new_response_string = RestClient.get(film_url)
#       new_response_hash = JSON.parse(new_response_string)
#       arr1 << new_response_hash
#     }

# else
#   # response_string = RestClient.get(response_hash["next"])
#   # response_hash = JSON.parse(response_string)
#   # p response_hash
# end

# # end

# }
# p arr1

# end
# p val2

# p response_hash

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

# get_character_movies_from_api("Greedo")
# get_character_movies_from_api("Darth Vader")


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
