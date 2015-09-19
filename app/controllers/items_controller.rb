class ItemsController < ApplicationController

  def index
    items = Item.all
    render json: items.to_json, status: 200
  end

  def show
    if Item.exists?(params[:id])
      item = Item.find(params[:id])
      render json: item.to_json, status: 200
    else
      render json: { error_msg: "Record not found!", id: params[:id] }.to_json, status: 404
    end
  end

  def create
    item = Item.create({ name: params[:name], price: params[:price], description: params[:description] })
    render json: item.to_json, status: 200
  end

  def update
  end

  def destroy
  end
end
