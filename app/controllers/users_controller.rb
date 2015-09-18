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
    if params[:first_name].empty? || params[:last_name].empty? || params[:age].empty?
      render json: { error_msg: "You've provided incomplete information" }.to_json, status: 404
    else
      user = User.create({ first_name: params[:first_name], last_name: params[:last_name], age: params[:age] })
      render json: user.to_json, status: 200
    end
  end

  def update
    user = User.find(params[:id])
    if params[:first_name]
      user.update(first_name: params[:first_name])
    end
    if params[:last_name]
      user.update(last_name: params[:last_name])
    end
    if params[:age]
      user.update(age: params[:age])
    end
    render json: user.to_json, status: 200
  end

  def destroy
  end

end
