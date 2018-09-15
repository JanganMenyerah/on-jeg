module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_driver
      flash.clear
      # if you have rails_driver. You can redirect anywhere really
      redirect_to(driver_order_page_path) && return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(pick_up_path) && return
    end
  end
end