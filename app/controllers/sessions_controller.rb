# = CONTROLADOR DE SECCION
class SessionsController < ApplicationController

  def new
  end

  #Metodo inicio seccion
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  #Metodo fin de seccion
  def destroy
  	sign_out
    	redirect_to root_url
  end

end
