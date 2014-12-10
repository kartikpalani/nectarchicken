class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        if product_params[:type] == "buy"
          format.html { redirect_to purchase_path, notice: 'Product was successfully bought.' }
          format.json { render :show, status: :ok, location: @product }
        else if product_params[:type] == "sell"
          format.html { redirect_to hawk_path, notice: 'Product was successfully sold.' }
        end
      else

        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def buy
    @product = Product.find(params[:id])
    #@vendor = Vendor.find(@product.vendor_id)
  end

  def purchase
    @product = Product.find(params[:id])
    $cash = $cash - @product.amt_paid
    $payable = $payable + @product.amt_debt
    @product.quantity = @product.quantity + @product.buy_quantity
    @product.save
    $inventory_total = $inventory_total + (@product.buy_quantity * @product.costprice)
    puts $inventory_total
    puts $cash
    redirect_to "/balance_sheets"
  end

  def sell
    @product = Product.find(params[:id])

  end

  def hawk
    @product = Product.find(params[:id])
    #@customer = Customer.find(@product.customer_id)
    $cash = $cash + @product.amt_sold
    $receivable = $receivable + @product.amt_loaned
    @product.quantity = @product.quantity - @product.sell_quantity
    @product.save
    $inventory_total = $inventory_total - (@product.sell_quantity * @product.costprice)
    $cogs = $cogs + (@product.sell_quantity * @product.costprice)
    $sales = $sales + (@product.sell_quantity * @product.sellprice)
    redirect_to "/balance_sheets"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :costprice, :sellprice, :vendor_id, :customer_id, :quantity, :amt_paid, :amt_debt, :amt_sold, :amt_loaned, :buy_quantity, :sell_quantity, :type)
    end
end
