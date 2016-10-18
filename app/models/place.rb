class Place < ActiveRecord::Base
    belongs_to :user
    validates :name, presence: true,
                     uniqueness: { case_sensitive: false, message: 'Place Name already taken. It must be unique.' },
                     length: { maximum: 60, minimum: 3 },
                     format: { with: /\A[a-zA-Z\.\,\-\'\ ]+\z/,
                               message: "Allows only letters, spaces, hyphen, apostrophe, comma, and period."}
    validates :address, presence: true, length: { maximum: 140, minimum: 3 }
    validates :description, presence: true, length: { maximum: 500, minimum: 10}
end
