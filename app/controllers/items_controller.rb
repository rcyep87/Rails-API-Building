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
    if params[:name].empty? || params[:price].nil? || params[:description].empty?
      render json: { error_msg: "You've provided incomplete information" }.to_json, status: 404
    else
      item = Item.create({ name: params[:name], price: params[:price], description: params[:description] })
      render json: item.to_json, status: 200
    end
  end

  def update
    if Item.exists?(params[:id])
      item              = Item.find(params[:id])
      item.name         = params.fetch(:name, item.name)
      item.price        = params.fetch(:price, item.price)
      item.description  = params.fetch(:description, item.description)
      render json: item.to_json, status: 200
    else
      render json: { error_msg: "Record not found" }.to_json, status: 404
    end
  end

  def destroy
    if Item.exists?(params[:id])
      Item.find(params[:id]).destroy
      render json: { msg: "You have successfully deleted an item from the database" }.to_json, status: 200
    else
      render json: { error_msg: "Item #{params[:id]} not found in database!" }.to_json, status: 404
    end
  end
end
