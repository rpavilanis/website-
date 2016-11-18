class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :picture, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
