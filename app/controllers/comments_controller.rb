class CommentsController < ApplicationController
	before_filter :redirect_back_unless_logged_in

  def create
  		@comment = Comment.find(params[:id])
  		@user_id = @comment.user_id
  		@current_user = User.find(@user_id)
			@comment = @current_user.comments.create(params[:comment]).merge(victim_id: params[:victim_id])
			redirect_to :back
	end

	

  private

	def redirect_back_unless_logged_in
		redirect_to :back unless @current_user.present?
	end
end
