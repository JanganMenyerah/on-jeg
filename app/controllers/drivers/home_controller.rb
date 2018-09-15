class Drivers::HomeController < ApplicationController
  before_action :authenticate_driver!

    def order_page
        @driver = Driver.find(current_driver.id)
        
          @order = Order.where(["driver_id = ? and completed_status = ?", @driver, "not completed"])
        if @order.present?
          @user = User.find(@order[0].user_id)
            @data = [@order, @user, @status]
        else
          @status= "no order"

        end
        

    end

    def completed_confirmation
      @driver = Driver.find(current_driver.id)
        @order = Order.where(["driver_id = ? and completed_status = ?", @driver, "not completed"])
        @order[0].completed_status = "completed"
        @order[0].save
        redirect_to driver_order_page_path
    end


end
