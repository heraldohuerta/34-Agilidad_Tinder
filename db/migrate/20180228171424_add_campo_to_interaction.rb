class AddCampoToInteraction < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :contador, :integer
  end
end
