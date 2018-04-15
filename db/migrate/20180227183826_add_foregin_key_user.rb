class AddForeginKeyUser < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :interactions, :users, column: :user_one_id
    add_foreign_key :interactions, :users, column: :user_two_id
  end
end
