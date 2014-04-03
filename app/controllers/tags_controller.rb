class TagsController < ApplicationController
  def new
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create #start here after lunch!!!
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
end
