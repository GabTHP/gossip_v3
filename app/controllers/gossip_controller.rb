class GossipController < ApplicationController
   before_action :find_post, only: [:show, :edit, :update, :destroy]
   before_action :is_author, only: [:edit, :update, :destroy]
   before_action :authenticate_user, only: [:index]
  
   def index
   @gossip = Gossip.new
  end

  def view
    id = session[:user_id]
    @user = User.find(id) #et hop, cette variable @user est l'instance User contenant toutes les infos de l'utilisateur connecté
  end


  def show
     @gossip = Gossip.find(params['id'])
  end

  def create


   @gossip = Gossip.create(title:params[:title], content: params[:content], user_id: current_user.id)
    if @gossip.save 
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @city = City.new
    @user = User.new
    @gossip = Gossip.new
  end

  def edit
    @gossip = Gossip.find(params["id"])
  end

  def update
    @gossip = Gossip.find(params["id"])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to gossip_path
  end

  def destroy
    @gossip = Gossip.find(params["id"])
    @gossip.destroy
    redirect_to root_path
  end

  private

  def find_post
  @gossip = Gossip.find(params[:id])
  end


  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  
end