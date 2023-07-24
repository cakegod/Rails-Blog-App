class CommentsController < ApplicationController
  before_action :set_article, only: %i[create destroy]
  http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

  def create
    @comment = @article.comments_create(comment_params)

    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments_find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
