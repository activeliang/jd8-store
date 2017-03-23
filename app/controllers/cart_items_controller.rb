class CartItemsController < ApplicationController

    def destroy
      @cart = current_cart
      @cart_item = @cart.cart_items.find_by( params[:id])
      @product = @cart_item.product
      @cart_item.destroy

      flash[:warning] = "成功将 #{@product.title} 从购物车删除!"
      redirect_to :back
    end

    def update
      @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
      if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
        @cart_item.update(cart_item_params)
        redirect_to :back, notice: "成功更新数量！"
      else
        flash[:warning] = "数量不足以加入购物车！"
        redirect_to :back
      end

    end

    private
    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
