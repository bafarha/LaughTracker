class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

	def new
		@tag = Tag.new
	end

	def create
		@new_tag = Tag.new(tag_params)
		if @new_tag.save
			redirect_to tag_path(@new_tag), notice: 'A new tag!  How exciting!'
		else
			render 'new'
		end
	end

	def show
		@tag = Tag.find(params[:id])
		@jokes = @tag.jokes
	end

	private
		def tag_params
			params.require(:tag).permit(:id, :title)
		end
	
end
