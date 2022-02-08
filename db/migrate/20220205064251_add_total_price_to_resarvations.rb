class AddTotalPriceToResarvations < ActiveRecord::Migration[6.1]
  def change
    add_column :resarvations, :total_price, :integer
  end
end
