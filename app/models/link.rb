class Link < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :url, :url=> {:allow_nil => true}

  def self.top10
    order(read: :desc).limit(10)
  end
end
