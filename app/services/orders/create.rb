module Orders
  class Create
    def initialize(user:, params:)
      @current_user = user
      @params = params
    end

    def call
      ActiveRecord::Base.transaction do
        order = Order.new(status: @params[:status])
        order.user = @current_user
        @params[:items].each do |item|
          product = Product.find(item[:product_id])
          check_product_quantity_availability(product ,item[:quantity])
          deduct_product_quantity(product, item[:quantity])
          order.order_items.build(
            product: product,
            price: product.price,
            quantity: item[:quantity]
          )
        end
        order.save!
        order
      end
    end

    def check_product_quantity_availability(product, quantity)
      if product.stock < quantity
        raise Errors::OutOfStockError, "Stock limit exceeded of #{product.name}"
      end
    end

    def deduct_product_quantity(product, quantity)
      new_stock_amount = product.stock - quantity
      product.update!(:stock => new_stock_amount)
    end

  end
end
