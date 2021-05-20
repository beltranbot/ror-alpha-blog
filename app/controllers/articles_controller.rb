class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all()
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article] # renders to browser
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to article_path(@article) # extracts id from article and uses it for the redirect
    else
      render "new"
    end
    # redirect_to @article # same functionality as the line above
  end
end
