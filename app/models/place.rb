class Place < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true,
                     length: { maximum: 60, minimum: 3 },
                     uniqueness: { case_sensitive: false, message: 'Place Name already taken. It must be unique.' }            
    validates :address, presence: true, length: { maximum: 140, minimum: 3 }
    validates :description, presence: true, length: { maximum: 500, minimum: 10}
end
