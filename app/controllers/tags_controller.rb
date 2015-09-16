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

	def update
		@tag = Tag.find(params[:id])
    respond_to do |format|
     	if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Joke added!' }
        format.json { render :show, status: :ok, location: @tag }
 		else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
     	end
     end
    end

	private
		def tag_params
			params.require(:tag).permit(:id, :title)
		end
	
end
