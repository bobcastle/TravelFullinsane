class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
   def favorite(article)
        favorites.find_or_create_by(article: article)
   end

   def unfavorite(article)
     favorites.where(article: article).destroy_all

     article.reload
   end

   def favorited?(article)
    favorites.find_by(article_id: article.id).present?
   end

  private
    def article_params
      params.require(:article).permit(:title, :text, :destination, :theme, :duree, :budget)
    end
end
