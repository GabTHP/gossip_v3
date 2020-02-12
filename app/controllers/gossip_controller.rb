class GossipController < ApplicationController
  def show
    @gossip = Gossip.find(params["id"])
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
end
