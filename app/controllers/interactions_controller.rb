class InteractionsController < ApplicationController



  def create
# SI DA DISLIKE MARCO FALSE EL USURIO DE LA LISTA DE MATCH

    if params[:like] == "false"
        Interaction.where(user_one_id: params[:user_two_id], user_two_id: current_user).update_all(like:"0")
        Matche.where(user_one_id: params[:user_two_id], user_two_id: current_user).destroy_all
        Matche.where(user_one_id: current_user, user_two_id: params[:user_two_id]).destroy_all
    end

    Interaction.save_or_increment(current_user,params[:user_two_id],params[:like])

    # EN EL CASO QUE NO EXISTA INTERACCION LA CREO DE LO CONTARIO ACTUALIZO
        # a = Interaction.where(user_one: current_user, user_two_id:params[:user_two_id])
        #  if a.count == 0
        #    Interaction.create(user_one: current_user, user_two_id:params[:user_two_id] , like:params[:like] )
        # else
        #   contador = a.first.contador + 1
        #   Interaction.where(user_one: current_user, user_two_id:params[:user_two_id]).update_all(like:params[:like],contador: contador )
        # end



    # ESTO ES SOLO PARA QUE NO DE ERROR  EL FORMULARIO PRINCIPAL
     # @matchs = Interacuser=128tion.where(user_two_id: current_user, like: true)
    redirect_to root_path()
  end





end
