class RemoveAvailableFromSurfboard < ActiveRecord::Migration[6.0]
  def change
    remove_column :surfboards, :available, :string
  end
end
