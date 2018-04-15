class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.integer :user_one_id, index: true, foreign_key: true
      t.integer :user_two_id, index:true, foreign_key: true
      t.boolean :like
      t.timestamps
    end
  end
end
