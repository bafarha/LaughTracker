class StaticPagesController < ApplicationController
  def index
  	if current_user
  	@user = User.find(current_user)
  	else
  	end
  end
end
