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
      redirect_to(authenticated_driver_root_path) && return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(new_order_path) && return
    end
  end
end