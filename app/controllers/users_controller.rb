class UsersController < ApplicationController

	def index
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def show
		@user=User.find(params[:id])
	end

	def create
		@user=User.new(user_params)
		if @user.save
			session[:user_id]=@user.id
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def edit
		@user=User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do | format |
			if @user.update(user_params)
				format.html { redirect_to @user, notice: 'Your info was updated!'}
				format.json { render :show, status: :ok, location: @user}
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :id)
		end
end
