class GossipController < ApplicationController
   before_action :find_post, only: [:show, :edit, :update, :destroy]
  def show
    @comment = Comment.where(gossip_id: @gossip.id)
  end

  def create
    @city = City.create(name: params[:city])
    @user = User.create(age: params[:age], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city_id: @city.id)
    @gossip = Gossip.new(user_id: @user.id, content: params[:content], title: params[:title]) # avec xxx qui sont les données obtenues à partir du formulaire
    if @gossip.save # essaie de sauvegarder en base @gossip
      @success = true
      render "gossip/new"
    else
      @city.destroy
      @user.destroy
      render "gossip/new"
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
  
end