class AuthorController < ApplicationController
def show
    @user = User.find(params["id"])
    @gossips = Gossip.all
end
end
