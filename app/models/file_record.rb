class FileRecord < ApplicationRecord
	mount_uploader :file, SheetUploader
	validates :name,:file, presence: true
	has_many :inci_records
end
