class Interaction < ApplicationRecord
  belongs_to :user_one, class_name:'User'  #Esto es necesario dado que Interaction tiene dos claves foraneas que apuntan a la misma tabl
  belongs_to :user_two, class_name:'User'  #Esto es necesario dado que Interaction tiene dos claves foraneas que apuntan a la misma tabl



    validates :user_one_id, uniqueness: {scope: :user_two_id, message: "cant interact twice with the same user"}
    validate :cant_interact_myself
    after_save :check_match
    before_save :set_counter





    def self.save_or_increment (user_one,user_two, like)
      a = Interaction.where(user_one: user_one, user_two_id: user_two).first
      if a.nil?
         Interaction.create(user_one: user_one, user_two_id: user_two, like: like)
      else
          a.contador += 1
        a.like = like
        a.save
      end
    end


    def set_counter
      self.contador ||= 0   #Mantiene el valor si exite de lo contrario = 0
    end

    def cant_interact_myself
      if self.user_one.id == self.user_two.id
        errors.add(:expiration_date, "can't interact with myself")
      end
    end

    def check_match
      i = Interaction.where(user_one: self.user_two, user_two:self.user_one)
      unless i.empty?
        Matche.create(user_one_id: self.user_one.id, user_two_id: self.user_two.id)
      end
    end
end
