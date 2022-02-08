class AddResarvationIdToResarvations < ActiveRecord::Migration[6.1]
  def change
    add_column :resarvations, :resarvation_id, :string
  end
end
