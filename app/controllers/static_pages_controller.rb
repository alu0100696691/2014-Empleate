# = CONTROLADOR PAGINAS ESTATICAS DEL PROYECTO: HOME,ABOUT,HELP,CONTACT
class StaticPagesController < ApplicationController
 	
 #------10.38
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end    
  
  def about
  end

  def ayuda
  end

  def contact
	@contacto = Contacto.new
  end

  #Metodo para salvar mensaje de contacto
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

