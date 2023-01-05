require_relative 'recipe'

class RecipesRepository
  def all
    recipes = []
    sql = 'SELECT id, recipe, average_cooking_time, rating FROM recipes;'
    results = DatabaseConnection.exec_params(sql, [])

    results.each do |record|
      recipe = Recipe.new

      recipe.id = record['id']
      recipe.recipe = record['recipe']
      recipe.average_cooking_time = record['average_cooking_time']
      recipe.rating = record['rating']
      recipes << recipe
    end
    return recipes
  end

  def find(name)
    params = [name]
    sql = 'SELECT id, recipe, average_cooking_time, rating FROM recipes WHERE recipe=$1'
    result = DatabaseConnection.exec_params(sql, params)
    
    recipe = Recipe.new
    recipe.recipe = result[0]['recipe']
    recipe.average_cooking_time = result[0]['average_cooking_time']
    recipe.rating = result[0]['rating']
    return recipe
  end
end