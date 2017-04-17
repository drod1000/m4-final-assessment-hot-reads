class Link < ApplicationRecord
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :url, :url=> {:allow_nil => true}
end
