class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 mount_uploader :url, ImageUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

# ESTO ES PARA QUE LA INTERACION NO SEA POR USER.ID, SINO QUE SEA POR USER_ONE_ID
# interaction_one sera un metodo que hara relacion con user_one_id
# interaction_two sera un metodo que hara relacion con user_two_id

has_many :interaction_one, class_name: "Interaction", foreign_key: :user_one_id, dependent: :destroy
has_many :interaction_two, class_name: "Interaction", foreign_key: :user_two_id, dependent: :destroy



end
