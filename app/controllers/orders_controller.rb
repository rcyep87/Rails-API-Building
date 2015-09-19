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
  end

  def update
  end

  def destroy
  end
end
