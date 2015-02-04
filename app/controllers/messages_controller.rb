class MessagesController < ApplicationController
  def new #form to make new msg
    @message = Message.new 
  end
 
  def create #restful route to make new msg!
  	@message = Message.new( msg_params )
    if @message.save
      sign_in @message
      flash[:enter_success] = 'Your message has been submitted'
    else
      flash[:enter_fail] = @message.errors.full_messages
    end
    redirect_to 'users/'+params[:id]
  end

  def destroy
  end

  #define strong parameters!
  private
    def msg_params
      params.require(:user).permit(:content)
    end
end
