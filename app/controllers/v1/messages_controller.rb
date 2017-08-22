class V1::MessagesController < V1::BaseController
  skip_before_filter :verify_authenticity_token, only: :create
  before_action :load_message, only: :update
  def create
    params[:list_email].each do |e|
      m = current_user.messages.new scr_params
      m.to = e
      m.save
    end
    response_success "Thành công"
  end

  def update
    if @message.update_attributes status: :seen
      response_success "Thành công"
    else
      response_error "Thất bại"
    end
  end

  def show
  end

  def index
    case
    when params[:type] == "list_user"
      resulf = []
      manager = current_user.manager
      project = current_user.projects.last
      resulf << {email: manager.email, name: "#{manager.name} - MANAGER"}
      if project.present?
        project.users.each do |u|
          resulf << {email: u.email, name: "#{u.name} - #{u.role.name}"}
        end
      end
    when params[:type] == "den"
      resulf = load_den
    else
      resulf = load_di
    end
    response_success "OK", resulf
  end

  private
  def scr_params
    params.require(:message).permit :title, :info
  end

  def load_message
    @message = Message.find_by id: params[:id]
    unless @message.present?
      response_not_found "Không tìm thấy phiên làm việc."
    end
  end

  def load_den
    resulf = []
    messages = Message.htd current_user.email
    if messages.present?
      binding.pry
      messages.each do |m|
        name = m.fromtable_type == "User" ? m.user.name : m.manager.name
        resulf << {id: m.id, name: name, created_at: m.created_at, status: m.status, title: m.title, info: m.info}
      end
    end
    resulf
  end

  def load_di
    resulf = []
    messages = current_user.messages
    if messages.present?
      binding.pry
      messages.each do |m|
        item = User.find_by email: m.to
        unless item.present?
          item = Manager.find_by email: m.to
        end
        resulf << {id: m.id, name: item.name, created_at: m.created_at, status: m.status, title: m.title, info: m.info}
      end
    end
    resulf
  end
end
