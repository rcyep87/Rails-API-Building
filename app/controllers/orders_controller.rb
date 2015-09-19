class OrdersController < ApplicationController

  def index
    orders = Order.all
    render json: orders.to_json, status: 200
  end

  def show
    order = Order.find(params[:id])
    render json: order.to_json, status: 200
  end

  def create
  end

  def update
  end

  def destroy
  end
end
