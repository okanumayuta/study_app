class Study < ApplicationRecord

  belongs_to :user
  
  validates :title, :content, presence: true

  def self.search(search)
    if search != ""
      Study.where(['title LIKE(?) OR language LIKE(?) OR framework LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Study.all
    end
  end
end
