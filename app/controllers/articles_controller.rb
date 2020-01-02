class ArticlesController < ApplicationController
  def index
    articles = Article.recent.
      page(params[:page]).
      per(params[:per_page])
    render json: serializer.new(articles)
  end

  def show
    article = Article.find(params[:id])
    render json: serializer.new(article)
  end

  private

  def serializer
    ArticleSerializer
  end
end