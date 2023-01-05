require_relative '../lib/recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/recipes_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe RecipesRepository do
  before(:each) do 
    reset_recipes_table
  end

  it "returns all records from the record db" do
    repo = RecipesRepository.new
    recipes = repo.all

    expect(recipes[0].id).to eq "1"
    expect(recipes[0].recipe).to eq "Pasta"
    expect(recipes[0].average_cooking_time).to eq "10"
    expect(recipes[0].rating).to eq "7" 

    expect(recipes[1].id).to eq "2" 
    expect(recipes[1].recipe).to eq 'Stir Fry' 
    expect(recipes[1].average_cooking_time).to eq "3" 
    expect(recipes[1].rating).to eq "4" 
  end
  
  it "returns a specific record from the record db" do
    repo = RecipesRepository.new
    recipe = repo.find('Pasta')

    expect(recipe.recipe).to eq "Pasta"
    expect(recipe.average_cooking_time).to eq "10"
    expect(recipe.rating).to eq "7" 
  end

  it "returns a specific record from the record db" do
    repo = RecipesRepository.new
    recipe = repo.find('Stir Fry')
    p recipe
    expect(recipe.recipe).to eq "Stir Fry"
    expect(recipe.average_cooking_time).to eq "3"
    expect(recipe.rating).to eq "4" 
  end
end