class ChangeDatatypeResarvationIdOfResarvations < ActiveRecord::Migration[6.1]
  def change
     add_column :resarvations, :resarvation_id, :integer
  end
end
