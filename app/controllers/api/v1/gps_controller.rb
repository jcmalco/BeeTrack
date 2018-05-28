class Api::V1::GpsController < ApplicationController
  respond_to :json

  def show
    respond_with Gp.find(params[:id])
  end

  def create
    gp = Gp.new(gp_params) 
      # if the gp is saved successfully than respond with json data and status code 201
    if gp.save 
      render json: gp, status: 201
    else
      render json: { errors: gp.errors}, status: 422
    end
  end

  def update
    gp = Gp.find(params[:id])

    if gp.update(gp_params)
      render json: gp, status: 200
    else
      render json: { errors: gp.errors }, status: 422
    end
  end

  def destroy
    gp = Gp.find(params[:id])
    gp.destroy
    head 204
  end

  private
  def gp_params
    params.require(:gp).permit(:latitude, :longitude, :sent_at, :vehicle_identifier) 
  end
end