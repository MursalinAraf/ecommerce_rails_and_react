class Api::V1::OrdersController < Api::V1::BaseController
  include Paginatable

  def index
   orders = Order.all
   render_success(paginate(orders))
  end

  def show
    order = Order.find_by(id: params[:id])
    if order
      render_success(order)
    else
      render_error("No order found in this ID", :not_found)
    end
  end

  def create
    order = Order.new(permitted_order_params)
    order.user = current_user
    order.order_items.each do |item|
      item.price = Product.find_by(id: item.product_id).price
    end
    if order.save
      render_success(order)
    else
      render_error(order.errors.full_messages, :not_found)
    end
  end

  private

  def permitted_order_params
    params.require(:order).permit(:status, order_items_attributes: [:product_id, :quantity])
  end

end
