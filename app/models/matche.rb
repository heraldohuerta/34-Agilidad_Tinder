class Matche < ApplicationRecord
  belongs_to :user_one, class_name: 'User', foreign_key: :user_one_id
  belongs_to :user_two, class_name: 'User', foreign_key: :user_two_id


  def get_user(id)
    byebug
    if self.user_one_id == id
      return self.user_two
    else
      return self.user_one
    end
  end
end
