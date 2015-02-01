class District < ActiveRecord::Base
  
  belongs_to :province

  validates :dis_name, presence: true, length: {minimum: 3}
end
