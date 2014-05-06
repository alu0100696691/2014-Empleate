class StaticPagesController < ApplicationController
  def home
  end

  def login
  end

  def about
  end

  def contact
	@contacto = Contacto.new(user_params)
	if @contacto.save
      		redirect_to home
    	else
      		render 'contacto'
    	end
  end

	private

    	def user_params
      		params.require(:contacto).permit(:name, :email, :mensaje)
    	end
end

