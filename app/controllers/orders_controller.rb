class OrdersController < ApplicationController

  def index
    orders = Order.all
    render json: orders.to_json, status: 200
  end

  def show
    if Order.exists?(params[:id])
      order = Order.find(params[:id])
      render json: order.to_json, status: 200
    else
      render json: { error_msg: "Unable to locate order with ID:#{params[:id]} in system!" }.to_json, status: 404
    end
  end

  def create
    user_id_array = []
    item_id_array = []

    User.ids.each do |id|
      user_id_array << id
    end

    Item.ids.each do |id|
      item_id_array << id
    end
    if item_id_array.include?(params[:item_id].to_i) && user_id_array.include?(params[:user_id].to_i)
      new_order = Order.create({ item_id: params[:item_id], user_id: params[:user_id], quantity: params[:quantity] })
      render json: new_order.to_json, status: 200
    else
      render json: { error_msg: "Either the user_id: #{params[:user_id]} or the item_id: #{params[:item_id]} you've provided is invalid! Please try again." }.to_json, status: 404
    end
  end

  def update
    if Order.exists?(params[:id])
      order           = Order.find(params[:id])
      order.item_id   = params.fetch(:item_id , order.item_id)
      order.user_id   = params.fetch(:user_id , order.user_id)
      order.quantity  = params.fetch(:quantity, order.quantity)
      render json: order.to_json, status: 200
    else
      render json: { error_msg: "Unable to locate order#: #{params[:id]} in system! Please try again." }.to_json, status: 404
    end
  end

  def destroy
    if Order.exists?(params[:id])
      Order.find(params[:id]).destroy
      render json: { msg: "Successfully deleted an order from the system!" }.to_json, status: 200
    else
      render json: { error_msg: "Unable to locate order#: #{params[:id]} in system! Please try again." }.to_json, status: 404
    end
  end
end
