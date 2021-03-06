class OrdersController < BaseController
 
  include CreateCart

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :current_cart , only: [:new , :create]


  # GET /orders
  # GET /orders.json  

  

  def index
    @orders = Order.page(params[:page]).per(3)
   
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    

    if @cart.line_items.empty?
      
        redirect_to root_url
      else
        @order = Order.new
    end

 
   
    
 
    

  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new order_params.merge(email: stripe_params["stripeEmail"],
                                                               card_token: stripe_params["stripeToken"])
    
    respond_to do |format|
      if @order.save
        @line_item1 = @cart.line_items.where(:cart_id => session[:cart_id])
        @line_item1.update_all(order_id:  @order.id)
        session['cart_id']=nil
        @order.process_payment(@cart.total_cart_price,"hi test")
        puts "-------#{@order.inspect}" 
       OrderNotify.received(@order).deliver
        format.html { redirect_to root_url, notice: 'order saved...ThAnK YoU FoR ThE PuRcHaSe........' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

   def stripe_params
      params.permit :stripeEmail, :stripeToken
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end
end
