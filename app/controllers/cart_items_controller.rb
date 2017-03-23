class CartItemsController < ApplicationController

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @cart_item.destroy
    @product = @cart_item.product
    redirect_to :back,alert: "成功将#{@product.title}移出购物车！"
  end
end
