class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @entry = Entry.find(params[:entry_id])
    @comment = @entry.comments.new(comment_params)
    if @comment.save
      @entry = Entry.find(params[:entry_id])
    else
      @entry = current_user.entries.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      redirect_to :back
    end
  end

  def destroy
    id = @comment.entry.id
    @comment.destroy
    @entry = Entry.find(id)
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :entry_id).merge(user_id: current_user.id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
