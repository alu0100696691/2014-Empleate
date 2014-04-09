class UsersController < ApplicationController
 
  def show
  @user = User.find(params[:id])
  
  end


  def new
	@titulo = "Registro de usuarios"
  end

end
