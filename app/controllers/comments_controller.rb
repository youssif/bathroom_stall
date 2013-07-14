class CommentsController < ApplicationController
	before_filter :redirect_back_unless_logged_in

  def create
  	# @user_id	= Rack.find(params[:user_id]
		@comment = Comment.create(params[:comment]) do |comment|
			comment.user_id = session[:user_id]
			comment.victim_id = params[:victim_id]

			# comment.save
		end



		redirect_to :back
	end


  private

	def redirect_back_unless_logged_in
		unless session[:user_id].present?
			flash[:notice] = "Please sign in to make a comment."
			redirect_to :back
			end
	end
end
