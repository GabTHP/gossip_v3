class UsersController < ApplicationController
  def show
    @user= User.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email],
      age: params[:age],
      description: params[:description],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      city: City.all.sample
      )
        if @user.save
      redirect_to profil_index_path
      log_in(@user)
      flash.alert = "Ton compte a bien été créé et tu es connecté !"

    else
      render :new
    end
  end


end
  