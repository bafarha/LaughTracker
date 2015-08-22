class JokesController < ApplicationController

	def index
		@jokes = Joke.all.order("created_at DESC")
	end

	def show
		@joke = Joke.find(params[:id])
		@tags = @joke.tags
	end

end
