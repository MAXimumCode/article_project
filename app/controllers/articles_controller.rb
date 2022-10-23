class ArticlesController < ApplicationController
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path(@articles), notice: 'Article was successfully created.'
    else
      flash[:warning] = 'Check entered values'
      render 'articles/new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article= Article.find(params[:id])

    if @article.update(article_update_params)
      redirect_to articles_path(@articles)
    else
      render edit_article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
    end
  end

  private

  def article_params
    params.require(:article).permit(:author, :title, :body)
  end

  def article_update_params
    params.require(:article).permit(:body)
  end
end
