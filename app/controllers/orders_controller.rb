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
    Order.create({ item_id: params[:item_id], user_id: params[:user_id], quantity: params[:quantity] })
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
  end
end
