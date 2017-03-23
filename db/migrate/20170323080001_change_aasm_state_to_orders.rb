class ChangeAasmStateToOrders < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:orders, :aasm_state, :"order_placed")
  end
end
