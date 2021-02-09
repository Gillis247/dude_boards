class AddAvailableToSurfboard < ActiveRecord::Migration[6.0]
  def change
    add_column :surfboards, :available, :boolean
  end
end
