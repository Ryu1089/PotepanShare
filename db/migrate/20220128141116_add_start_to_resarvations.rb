class AddStartToResarvations < ActiveRecord::Migration[6.1]
  def change
    add_column :resarvations, :start, :datetime
    add_column :resarvations, :end, :datetime
    add_column :resarvations, :people, :integer
  end
end
