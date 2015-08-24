class JokesController < ApplicationController

	def index
		@jokes = Joke.all.order("created_at DESC")
	end

	def new
		@joke = Joke.new
	end

	def edit
		@joke = Joke.find(params[:id])
	end

	def create
		@new_joke = Joke.new(joke_params)
		if @new_joke.save
			redirect_to "/jokes"	
		else
			render 'new'
		end
	end

	def show
		@joke = Joke.find(params[:id])
		@tags = @joke.tags
	end

	def update
    respond_to do |format|
     	if @joke.update(joke_params)
        format.html { redirect_to @joke, notice: 'Great new joke you got there!' }
        format.json { render :show, status: :ok, location: @product }
 		  else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
	
	private
		def joke_params
			params.require(:joke).permit(:title, :content)
		end
end