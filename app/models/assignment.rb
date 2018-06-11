class Assignment < ApplicationRecord

  mount_uploader :attachment, AttachmentUploader
	belongs_to :user
	belongs_to :cat_note
  belongs_to :sem_date
  belongs_to :institution

  validates :course_code,presence:true
	validates :course_name,presence:true
	validates :semester,presence:true
	validates :attachment,presence:true
	validates :cat_note,presence:true
  validates :semdate,presence:true
  validates :year_of_study,presence:true

	validates :semester, numericality: { greater_than: 0 }
  validates :semester, numericality: { less_than: 2 }

  validates :year_of_study, numericality: { greater_than: 0 }
  validates :semester, numericality: { less_than: 2 }

  def self.search(search)
   where("course_name LIKE ? OR course_code LIKE ? OR semester LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

end
