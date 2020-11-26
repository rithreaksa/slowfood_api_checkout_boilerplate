class Api::OrdersController < ApplicationController
  before_action :authenticate_user!
  def create
    product = Product.find_by(id: params[:product_id])
    order = current_user.orders.create
    order.items << product
    order.save
    binding.pry
  end
end
