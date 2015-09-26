class NotesController < ApplicationController

	def create
		@joke = Joke.find(params[:joke_id])
		@note = @joke.notes.new(note_params)
		@note.user = current_user
		respond_to do |format|
			if @note.save
				format.html { redirect_to @joke, notice: 'Note saved.'}
				format.json { render :show, satus: :created, location: @joke}
			else
				format.html { redirect_to @joke, alert: 'Sorry, your note was not saved.'}
				format.json { render json: @note.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@note = Note.find(params[:id])
		joke = @note.joke
		@note.destroy
		redirect_to joke
	end

	private
	def note_params
		params.require(:note).permit(:user_id, :body, :rating)
	end

end
