class MessagesController < ApplicationController
  before_action :load_message, only: :update

  def index
    case
    when params[:type] == "di"
      @type = params[:type]
      @messages = current_manager.messages
    else
      @messages = Message.htd current_manager.email
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    if @message.noseen?
      @message.update_attributes status: :seen
    end
    respond_to do |format|
      format.js
    end
  end

  def create
    binding.pry
    case
    when params[:type] == "fast"
      @message = current_manager.messages.new message_params
      if @message.save
        flash[:suceess] = "Gửi thành công"
      else
        flash[:danger] = "Thất bại"
      end
    else
      case
      when params["mail-type"] == "check-user"
        params["messages-list-user"].each do |m|
          binding.pry
          message = current_manager.messages.new message_params_new
          message.to = m
          message.save
        end
      else
        params["messages-list-project"].each do |m|
          project = Project.find_by id: m
          if project.present?
            project.users.each do |p|
              message = current_manager.messages.new message_params_new
              message.to = p.email
              message.save
            end
          end
        end
      end
    end
    respond_to do |format|
      format.html do
        redirect_to messages_path
      end
    end
  end

  def new
    @projects = current_manager.projects
    @staffs = current_manager.users
  end

  private
  def message_params_new
    params.require(:message).permit :title, :info
  end

  def load_message
    @message = Message.find_by id: params[:id]
    unless @message.present?
      flash[:danger] = "Không tìm thấy thông báo."
      respond_to root_path
    end
  end

  def message_params
    params.require(:message).permit :to, :title, :info, :fromtable_type, :fromtable_id
  end
end
