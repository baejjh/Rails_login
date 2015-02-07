class MessagesController < ApplicationController
  def new #form to make new msg
    @message = Message.new 
  end
 
  def create #restful route to make new msg!
  	@message = Message.new( msg_params )
    if @message.save
      sign_in @message
      flash[:enter_success] = 'Your message has been submitted.'
      # render json: @message
      redirect_to '/users/'+msg_params[:user_id]
    else
      flash[:enter_fail] = @message.errors.full_messages
      # render json: @message
      redirect_to '/users/'+msg_params[:user_id]
    end
  end

  def edit
    @one_message = Message.find( msg_params[:user_id] )
  end

  def update
    @update_message = Message.find( id_params ).update( msg_params )
    if @update_message
        redirect_to '/users/'+msg_params[:user_id]
    else
        flash[:edit_error] = "Your message is empty."
        redirect_to '/users/'+msg_params[:user_id]+'/edit'
    end
  end

  def delete
    @one_message = Message.find( msg_params[:user_id] )
  end

  def destroy
        @delete_message = Message.find( msg_params[:user_id])
        if @delete_message.present?
            @delete_message.destroy
            flash[:enter_success] = "You have successfully deleted the user"
        else
            flash[:enter_fail] = @delete_message.errors.full_messages
        end
        redirect_to '/'
    end

  #define strong parameters!
  private
    def msg_params
      params.require(:message).permit(:content, :user_id)
    end
end
