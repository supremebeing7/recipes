class TagsController < ApplicationController
  def new
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      params[:tag][:slug] = ("#{@tag.id}-#{@tag.name}").parameterize
      @tag.update(params[:tag])
      flash[:notice] = "Your tag was added to the RecipeMaster8000."
      redirect_to("/recipes")
    else
      flash[:alert] = "Try again, silly"
      render('tags/new.html.erb')
    end
  end

  def show
    @tag = Tag.find_by(slug: params[:tag_slug])
    render('tags/show.html.erb')
  end

  def edit
    @tag = Tag.find_by(slug: params[:tag_slug])
    render('tags/edit.html.erb')
  end

  def update
    @tag = Tag.find_by(slug: params[:tag_slug])
    if @tag.update(params[:tag])
      redirect_to("/tags/#{@tag.slug}")
    else
      render('tags/edit.html.erb')
    end
  end

  def destroy
    @tag = Tag.find_by(slug: params[:tag_slug])
    @tag.destroy
    flash[:notice] = "Your tag was deleted from the RecipeMaster8000."
    redirect_to("/recipes")
  end
end
