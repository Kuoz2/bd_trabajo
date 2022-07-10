class BinnaclesController < ApplicationController
  before_action :set_binnacle, only: [:show, :update, :destroy]

  # GET /binnacles
  def index
    @binnacles = Binnacle.all

    render json: @binnacles
  end

  # GET /binnacles/1
  def show
    render json: @binnacle
  end

  # POST /binnacles
  def create
    @binnacle = Binnacle.new(binnacle_params)

    if @binnacle.save
      render json: @binnacle, status: :created, location: @binnacle
    else
      render json: @binnacle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /binnacles/1
  def update
    if @binnacle.update(binnacle_params)
      render json: @binnacle
    else
      render json: @binnacle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /binnacles/1
  def destroy
    @binnacle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_binnacle
      @binnacle = Binnacle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def binnacle_params
      params.require(:binnacle).permit(:asunto, :q_se_iso, :hora, :dia)
    end
end
