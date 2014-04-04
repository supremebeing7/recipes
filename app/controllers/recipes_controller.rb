class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @recipe = Recipe.new
    @tags = Tag.all
    render('recipes/index.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @tags = Tag.all
    @all_tags = []
    params[:tag].each { |key, value| @all_tags << Tag.find_by(name: value) }
    @all_tags.each { |tag| @recipe.tags << tag }
    if @recipe.save
      params[:recipe][:slug] = ("#{@recipe.id}-#{@recipe.name}").parameterize
      @recipe.update(params[:recipe])
      flash[:notice] = "Your recipe was added to the RecipeMaster8000."
      redirect_to("/recipes/#{@recipe.slug}")
    else
      flash[:alert] = "Try again, doofus"
      redirect_to("/recipes")
    end
  end

  def show
    @recipe = Recipe.find_by(slug: params[:recipe_slug])
    render('recipes/show.html.erb')
  end

  def edit
    @tags = Tag.all
    @recipe = Recipe.find_by(slug: params[:recipe_slug])
    render('recipes/edit.html.erb')
  end

  def update
    @rating = Rating.create(params[:rating])
    @recipe = Recipe.find_by(slug: params[:recipe_slug])
    @recipe.ratings << @rating
    if @recipe.update(params[:recipe])
      flash[:notice] = "Your recipe was updated on the RecipeMaster8000."
      redirect_to("/recipes/#{@recipe.slug}")
    else
      flash[:alert] = "Try again, nerd"
      render('recipes/edit.html.erb')
    end
  end

  def destroy
    @recipe = Recipe.find_by(slug: params[:recipe_slug])
    @recipe.destroy
    flash[:notice] = "Your recipe was deleted from the RecipeMaster8000."
    redirect_to("/recipes")
  end
end
