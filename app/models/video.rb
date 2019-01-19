class Video < ApplicationRecord
  attr_accessor :url

  belongs_to :user
  
  validates :title, presence: true
  before_validation :set_youtube_uuid

  def set_youtube_uuid
    data = self.url.match(/https?:\/\/www\.youtube\.com\/watch\?v=(\w{11})/)
    return false if data.nil?
    self.youtube_uuid = data[1]
  end
end