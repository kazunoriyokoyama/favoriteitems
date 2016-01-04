class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    @messages_f = Message.where("sex = '2'")
    @messages_m = Message.where("sex = '1'")
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages_f = Message.where("sex = '2'")
      @messages_m = Message.where("sex = '1'")
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'messages/index'
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to messages_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to messages_path, notice: 'メッセージを削除しました'
  end
  
  
  
  
  private
  def message_params
    params.require(:message).permit(:name, :body, :sex)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
end
