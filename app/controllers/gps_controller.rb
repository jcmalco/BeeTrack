class GpsController < ApplicationController

  def index
    @gps = Gp.all
  end

  def show
    @gp = Gp.find(params[:id]) 
  end
  # new gps
  def new
    @gp = Gp.new
  end
  # edit gps
  def edit
    @gp = Gp.find(params[:id])
  end
  # when new form call create
  def create
    @gp = Gp.new(gp_params)
    if @gp.save
      redirect_to @gp, notice: "Gps ha sido guardado correctamente."
    else
      render :new
    end
  end
  # when edit form call update
  def update
    @gp = Gp.find(params[:id])
    if @gp.update_attributes(gp_params)
      redirect_to @gp, notice: "Gps ha sido actualizado."
    else
      render :edit
    end
  end
  # delete gps
  def destroy
    @gp = Gp.find(params[:id])
    @gp.destroy
    redirect_to gps_url, notice: "Gps ha sido borrado."
  end
  
  private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def gp_params
      params.require(:gp).permit(:latitude, :longitude, :sent_at, :vehicle_identifier)
    end

end