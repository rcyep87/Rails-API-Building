class UsersController < ApplicationController

  def index
    users = User.all
    render json: users.to_json, status: 200
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render json: user.to_json, status: 200
    else
      render json: { error_msg: "Record not found!", id: params[:id] }.to_json, status: 404
    end

  end

  def create
  end

  def update
  end

  def destroy
  end

end
