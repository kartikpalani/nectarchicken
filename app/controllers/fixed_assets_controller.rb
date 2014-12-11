class FixedAssetsController < ApplicationController
  before_action :set_fixed_asset, only: [:show, :edit, :update, :destroy]

  # GET /fixed_assets
  # GET /fixed_assets.json
  def index
    @fixed_assets = FixedAsset.all
  end

  # GET /fixed_assets/new
  def new
    @fixed_asset = FixedAsset.new
  end

  # POST /fixed_assets
  # POST /fixed_assets.json
  def create
    @fixed_asset = FixedAsset.new(fixed_asset_params)
    loan = @fixed_asset.asset_loan
    $asset_loan_total = $asset_loan_total + loan
    fixed_asset_cost = @fixed_asset.asset_cost
    $asset_cost_total = $asset_cost_total + fixed_asset_cost
    fixed_asset_paid = @fixed_asset.asset_paid
    $cash = $cash - fixed_asset_paid
    respond_to do |format|
      if @fixed_asset.save
        format.html { redirect_to fixed_assets_path, notice: 'Fixed asset was successfully created.' }
        format.json { render :show, status: :created, location: @fixed_asset }
      else
        format.html { render :new }
        format.json { render json: @fixed_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fixed_asset.destroy
    respond_to do |format|
      format.html { redirect_to fixed_assets_url, notice: 'Fixed asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_asset
      @fixed_asset = FixedAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixed_asset_params
      params.require(:fixed_asset).permit(:asset_cost, :asset_loan, :asset_paid, :asset_name)
    end
end
