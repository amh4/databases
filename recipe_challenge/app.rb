require_relative 'lib/recipe_repository'
require_relative 'lib/recipe'
require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

repo = RecipesRepository.new

recipes = repo.all

recipes.each do |item|
  puts item.recipe + " " + item.average_cooking_time + " " + item.rating
end

recipe = repo.find('Pasta')

p recipe.recipe
p recipe.average_cooking_time
p recipe.rating