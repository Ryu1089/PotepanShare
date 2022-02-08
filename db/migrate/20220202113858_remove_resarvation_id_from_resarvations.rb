class RemoveResarvationIdFromResarvations < ActiveRecord::Migration[6.1]
  def change
    remove_column :resarvations, :resarvation_id, :string
  end
end
