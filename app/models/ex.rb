class Ex < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: {thumb:'150x150#', medium:'300x300#'}
  validates_attachment :image, presence: true, content_type:  { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :note_sex, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :note_humour, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :note_gentilesse, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  before_save :update_note

  private

  def update_note
    self.note = ((self.note_sex.to_f + self.note_humour.to_f + self.note_gentilesse.to_f) / 3).round
  end

end
