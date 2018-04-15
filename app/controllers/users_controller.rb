class UsersController < ApplicationController
  before_action :authenticate_user!
  def search
     @user = User.order("RANDOM()").first

###############################
# ESTO ES PARA LLEVAR LOS USARIOS QUE ME HAN DADO LIKE
   @matchs = Interaction.where(user_two_id: current_user.id, like: 1)

   # @matchs = User.find(current_user.id).interaction_two.where(like: 1)

# SOLO LOS ID QUE ME HAN HECHO MATCH
    @unicos =  @matchs.pluck("distinct(user_one_id)")
# LOS DATOS DE LOS USARIOS QUE ME HAN HECHO LIKE
    @users  = User.where("id IN (?)", @unicos)
#CONTADOR DE LAS VECES QUE ME HAN HECHO LIKE
    @count = {}
    @matchs.each do |v|
          @count[v.user_one_id] = v.contador
    end

     # render json: @user.to_json

# HARA APARECER UN BOTON DE MATCH, LOS PARAMS VIENE DESDE INTERACTION
# BUSCO PARA VER SI HAY ALGUN TIPO DE MATCH

      @existe_match = Interaction.where(user_two_id:current_user.id , like: true)
      if @existe_match.count > 0
        @matches = "true"
        @user_match =  @existe_match.first.user_one_id
      else
         @matches = "false"
      end

    if !@user_match.nil?
      @user_match_like = User.find(@user_match)
    else
      @user_match_like  = User.new

    end

  end
end
