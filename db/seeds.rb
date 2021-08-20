require 'json'
require 'open-uri'

puts 'destroying all existing movies'

Movie.destroy_all
puts 'creating movies'
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['TMDB_API_KEY']}"

uri = URI.parse(url)
serialized_search = uri.read
results = JSON.parse(serialized_search)
movies = results['results']

movies.each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
