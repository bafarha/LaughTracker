class NotesController < ApplicationController

	def create
		@joke = Joke.find(params[:joke_id])
		@note = @joke.notes.new(note_params)
		@note.user = current_user
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @joke, notice: 'Note saved.'}
				format.json { render :show, satus: :created, location: @joke}
			else
				format.html { redirect_to @joke, alert: 'Sorry, your note was not saved.'}
				format.json { render json: @note.errors, status: :unprocessable_entity }
			end
		end
	end
end