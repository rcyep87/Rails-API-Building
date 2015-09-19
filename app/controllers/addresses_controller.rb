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

  def create
    id_array = []
    User.select(:id).each do |id|
      id_array << id
    end

    if id_array.include?(params[:user_id])
      new_address = Address.create({ user_id: params[:user_id], street_name: params[:street_name], city: params[:city], state: params[:state], zip: params[:zip] })
      render json: new_address.to_json, status: 200
    else
      render json: { error_msg: "The user_id you've supplied is incorrect! Please try again."}.to_json, status: 404
    end
  end

  def update
    if Address.exists?(params[:id])
      address             = Address.find(params[:id])
      address.user_id     = params.fetch(:user_id, address.user_id)
      address.street_name = params.fetch(:street_name, address.street_name)
      address.city        = params.fetch(:city, address.city)
      address.state       = params.fetch(:state, address.state)
      address.zip         = params.fetch(:zip, address.zip)
      render json: address.to_json, status: 200
    else
      render json: { error_msg: "Record not found!", id: params[:id] }.to_json, status: 404
    end
  end

  def destroy
    if Address.exists?(params[:id])
      address = Address.find(params[:id])
      address.destroy
      render json: { msg: "Address has been deleted from the database!" }.to_json, status: 200
    else
      render json: { error_msg: "Record not found!", id: params[:id] }.to_json, status: 404
    end
  end

end
