class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.create(comment_params)
    redirect_to gossip_path(@gossip)
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comments = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    comment_params_update = params.require(:comment).permit(:content)
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params_update)
    render gossip_path(@gossip.id)
    else
      :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/"
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end