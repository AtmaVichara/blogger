class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "You have Successfully Created #{@article.title}"
    end
    redirect_to article_path @article
  end

  def destroy
    @article.destroy

    flash.notice = "You have Successfully Deleted the #{@article.title}"

    redirect_to articles_path
  end

  def edit
  end

  def update
    @article.update!(article_params)

    flash.notice = "You Have Successfully Updated #{@article.title}"

    redirect_to article_path(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
