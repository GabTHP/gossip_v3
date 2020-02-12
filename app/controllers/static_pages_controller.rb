class StaticPagesController < ApplicationController
  def home
    @gossips = Gossip.all
  end
end
