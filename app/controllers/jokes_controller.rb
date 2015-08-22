class JokesController < ApplicationController

	def index
		@jokes = Joke.all.order("created_at DESC")
	end

end
