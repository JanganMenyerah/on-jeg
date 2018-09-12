class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  @@pick_up = "asd"
  @@destination = "asd"
  @@pick_up_address = "asd"
  @@destination_address = "asd"

  # GET /orders
  # GET /orders.json
  # def index
  #   @orders = Order.all
  # end

  # GET /orders/1
  # GET /orders/1.json
  # def show
  # end

  # GET /orders/new
  def new
    @order = Order.new
    @data = [@@pick_up, @@destination, @@pick_up_address, @@destination_address]
    # render plain: @data.inspect

  end

  # GET /orders/1/edit
  # def edit
  # end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new
    @order.pick_up_location = @@pick_up_address
    @order.destination_location = @@destination_address
    @order.pick_up_place_id = @@pick_up
    @order.destination_place_id = @@destination
    @order.notes_for_driver = params[:notes_for_driver]
    @order.date = DateTime.now
    @order.cost = params[:cost]

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'Order was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @order }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @order.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pick_up

  end

  def destination

  end

  def pick_up_post
    @@pick_up = params[:pick_up]
    @@pick_up_address = params[:pick_up_address]


    # render plain: @pick_up.inspect
    redirect_to destination_path
  end

  def destination_post
    @@destination = params[:destination]
    @@destination_address = params[:destination_address]

    redirect_to new_order_path

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def order_params
    #   # params.fetch(:order, {})
      
    #   params.require(:order).permit(:pick_up_location, :destination_location, :cost)
    # end
end
