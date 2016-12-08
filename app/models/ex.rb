class Ex < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: {thumb:'150x150#', medium:'300x300#'}
  validates_attachment :image, presence: true, content_type:  { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
