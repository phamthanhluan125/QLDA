class Screenshot < ApplicationRecord
  belongs_to :timesheet

  mount_base64_uploader :image, ScreenshotUploader
end
