class FileRecord < ApplicationRecord
	acts_as_tenant(:user)
	mount_uploader :file, SheetUploader
	validates :name,:file, presence: true
	has_many :inci_records
end
