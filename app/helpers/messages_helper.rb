module MessagesHelper
  def load_status_mess message
    if message.noseen?
      label_tag "stattus", "Chưa xem", class: "btn btn-success btn-xs status-message"
    else
      label_tag "stattus", "Đã xem", class: "btn btn-info btn-xs status-message"
    end
  end
end
