class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:product_id])
    
    # check if product exists in cart, if not add it else add to quantity
    @line_item = @cart.line_items.select { |line_item| line_item.product == product }.first
    if @line_item.nil?
      @line_item = @cart.line_items.build(product: product)
    end    
    @line_item.increment(:quantity, by = 1)
 
    respond_to do |format|
      if @line_item.save
        session[:last_product_page] = request.env['HTTP_REFERER'] || root_url
        format.html { redirect_to @line_item.cart, 
          notice: 'Line item was successfully created.' }
        format.json { render action: 'show', 
          status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  #original destroy
  # def destroy
  #   @line_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to line_items_url }
  #     format.json { head :no_content }
  #   end
  # end


  # DELETE /line_items/1
  # DELETE /line_items/1.json
  # remove from cart
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.cart, 
          alert: 'Line item was successfully removed.' }
      # format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  # def remove_from_cart
  #   @line_item.destroy
  #   respond_to do |format|
  #     format.html { redirect_to @line_item.cart }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id, :quantity)
    end

    # def line_item_exists
    #   unless @line_item.include?(@cart)
    #     @line_item.increment(:quantity, by = 1)
    #     @line_item.save
    #   end
    # end

# end


end
