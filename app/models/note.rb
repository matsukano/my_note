class Note < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Note.where('text LIKE(?)', "%#{search}%")
    else
      Note.all
    end
  end
end
