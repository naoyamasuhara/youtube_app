class Video < ApplicationRecord
  belongs_to :user
   
  validates :title, presence: true
  before_validation :set_youtube_uuid

  def set_youtube_uuid
    self.youtube_uuid = youtube_uuid.gsub!('(?:v=)(.+)')
  end
end