class Api::V1::OrdersController < Api::V1::BaseController
  include Paginatable
  include Orders

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
    order = ::Orders::Create.new(user: current_user, params: permitted_order_params).call
    render_success(order)
    rescue ActiveRecord::RecordInvalid => e
      render_error(e.record.errors.full_messages, :unprocessable_entity)
    rescue ActiveRecord::RecordNotFound => e
      render_error(e.record.errors.full_messages, :not_found)
  end

  def get_total_count
    count = 0
    orders = Order.where(user_id: current_user).where(status: "pending")
    orders.each do |order|
      order.order_items.each do |item|
        count += item.price
        count *= item.quantity
      end
    end
    render_success(count)
  end

  private

  def permitted_order_params
    params.require(:order).permit(:status, items: [:product_id, :quantity])
  end

end
