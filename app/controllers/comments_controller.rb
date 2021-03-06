class CommentsController < ApplicationController
	
	def create
		@episode = Episode.find(params[:episode_id])
		@comment = @episode.comments.new(comment_params)
		@comment.user = current_user

		respond_to do |format|
	      if @comment.save
	        format.html { redirect_to @episode, notice: 'Review was created successfully.' }
	        format.json { render :show, status: :created, location: @episode }
	        format.js
	      else
	        format.html { redirect_to @episode, alert: 'Review was not saved successfully.' }
	        format.json { render json: @comment.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
		@comment = Comment.find(params[:id])
		episode = @comment.episode
		@comment.destroy
		redirect_to episode
	end

	private

		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end

end
