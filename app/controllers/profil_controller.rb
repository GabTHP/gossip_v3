class ProfilController < ApplicationController

  def index
        @gossips = Gossip.all
    end
  
  def view
    id = session[:user_id]
    @user = User.find(id) #et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
  end

  def show
  end


end
