class Province < ActiveRecord::Base
	has_many :districts
	validates :name, presence: true, length: {minimum: 3}
end
