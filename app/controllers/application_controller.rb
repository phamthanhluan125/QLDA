require "json_response"

class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :update_status_of_model

  private
  def change_status items
    items.each do |item|
      case
      when Date.today > item.deadline
        if !item.delay?
          item.update_attribute :status, :delay
        end
      when Date.today >=  item.start_date
        if !item.running?
          item.update_attribute :status, :running
        end
      when Date.today <  item.start_date
        if !item.pending?
          item.update_attribute :status, :pending
        end
      end
    end
  end

  def update_status_of_model
    change_status(Project.for_update_status)
    change_status(Task.for_update_status)
    change_status(TaskManager.for_update_status)
  end

  JsonResponse::STATUS_CODE.keys.each do |status|
    define_method "response_#{status}" do |message = "", content = {}|
      render json: JsonResponse.send(status, message, content)
    end
  end
end
