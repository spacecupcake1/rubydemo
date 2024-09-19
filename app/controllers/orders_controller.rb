class OrdersController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @quantity = params[:quantity].to_i
  
    ActiveRecord::Base.transaction do
      # Pessimistisches Locking
      @product.lock!
      if @product.quantity >= @quantity
        @product.quantity -= @quantity
        @product.save!
        Order.create!(product: @product, quantity: @quantity)
        redirect_to @product, notice: 'Order was successfully created.'
      else
        raise ActiveRecord::Rollback, "Not enough inventory"
      end
    end
  rescue ActiveRecord::Rollback
    redirect_to @product, alert: 'Order failed: Not enough inventory.'
  end  
end
