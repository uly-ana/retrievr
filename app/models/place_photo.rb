class PlacePhoto < ApplicationRecord
  belongs_to :place
  mount_uploader :photo, PhotoUploader
end
