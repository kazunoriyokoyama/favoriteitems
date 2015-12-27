class HomeController < ApplicationController
  def index
    # render 'login' unless user_signed_in?
    # redirect_to new_user_session_url unless user_signed_in?
    
    if user_signed_in?
    redirect_to messages_url
    else
    render 'login'
    end
  
  end

end
