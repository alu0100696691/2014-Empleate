class StaticPagesController < ApplicationController
  def home
  end
  
  def about
  end

  def contact
	@contacto = Contacto.new
  end

  def create
	@contacto = Contacto.new(params[:contacto])
        if @contacto.save
                flash[:success] = "Se ha enviado su mensaje correctamente."
		redirect_to root_path
        else
                flash[:success] = "Error. No se ha podido enviar su mensaje."
                #render 'new'
        end

  end  

end

