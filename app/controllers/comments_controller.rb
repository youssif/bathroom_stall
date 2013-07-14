class CommentsController < ApplicationController
	before_filter :redirect_back_unless_logged_in

  def create
		@comment = @current_user.comments.create(params[:comment]).merge(victim_id: params[:victim_id])
		redirect_to :back
	end

	

  private

	def redirect_back_unless_logged_in
		redirect_to :back unless @current_user.present?
	end
end
