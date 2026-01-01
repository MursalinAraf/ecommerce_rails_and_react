class Api::V1::ProductsController < Api::V1::BaseController
include Paginatable

  def index
    products = Product.all
    render_success(paginate(products))
  end

  def show
    product = Product.find_by(id: params[:id])
    if product
      render_success(product)
    else
      render_error("No product matches with this id", :not_found)
    end
  end

  def create
    product = Product.new(permitted_product_params)
    if product.save
      render_success(product)
    else
      render_error(product.errors.full_messages, :not_found)
    end
  end

  def update
    product = Product.find_by(id: params[:id])
    return render_error("Product not found", :not_found) unless product

    if product.update(permitted_product_params)
      render_success(product)
    else
      render_error(product.errors.full_messages)
    end 
  end

  def destroy
    product = Product.find_by(id: params[:id])
    return render_error("Product not found", :not_found) unless product

    if product.destroy
      render_success({ message: "Product #{product.name} is destroyed successfully"})
    else
      render_error("#{product.name} Deletion failed")
    end
  end

  private

  def permitted_product_params
    params.require(:product).permit(:name, :price, :description, :stock)
  end

end
