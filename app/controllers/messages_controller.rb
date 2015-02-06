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

  #define strong parameters!
  private
    def msg_params
      params.require(:message).permit(:content, :user_id)
    end
end
