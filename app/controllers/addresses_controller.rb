class AddressesController < ApplicationController

  def index
    addresses = Address.all
    render json: addresses.to_json, status: 200
  end

  def show
    if Address.exists?(params[:id])
      addresses = Address.find(params[:id])
      render json: addresses.to_json, status: 200
    else
      render json: { error_msg: "Record not found!", id: params[:id] }.to_json, status: 404
    end
  end

  end

  def create
  end

  def update
  end

  def destroy
  end
end
