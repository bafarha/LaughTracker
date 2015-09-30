class JokesController < ApplicationController
before_action :require_user, only: [:index, :show, :new, :edit]
	def index
		if params[:tag]
			@user = User.find(current_user)
			@jokes = @user.jokes.tagged_with(params[:tag]).order("created_at DESC")
			@tag = @jokes.name
		else
			@user = User.find(current_user)
			@jokes = @user.jokes.all.order("created_at DESC")
		end
	end

	def new
		@user = User.find(current_user)
		@joke = Joke.new
	end

	def edit
		@user = User.find(current_user)
		@joke = Joke.find(params[:id])
	end

	def create
		@new_joke = current_user.jokes.new(joke_params)
		if @new_joke.save
			redirect_to joke_path(@new_joke), notice: 'Great new joke you got there!'
		else
			render 'new'
		end
	end

	def show
		@user= User.find(current_user)
		@joke = Joke.find(params[:id])
		@notes = @joke.notes.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def update
		@joke = Joke.find(params[:id])
    	respond_to do |format|
     		if @joke.update(joke_params)
        		format.html { redirect_to @joke, notice: 'Great new joke you got there!' }
        		format.json { render :show, status: :ok, location: @joke }
 		  	else
        		format.html { render :edit }
        		format.json { render json: @product.errors, status: :unprocessable_entity }
      		end
      	end
    end

    def destroy
    	@joke = Joke.find(params[:id])
    	@joke.destroy
    	respond_to do |format|
      		format.html { redirect_to jokes_url, notice: 'That joke is outta here!' }
      		format.json { head :no_content }
   	 	end
  	end
	
	private
		def joke_params
			params.require(:joke).permit(:id, :title, :content, :tag_list, :user_id, :tag)
		end
end