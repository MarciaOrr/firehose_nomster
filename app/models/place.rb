class Place < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :photos

    geocoded_by :address
    after_validation :geocode


    validates :name, presence: true,
                     length: { maximum: 60, minimum: 3 },
                     uniqueness: { case_sensitive: false, message: 'Place Name already taken. It must be unique.' }            
    validates :address, presence: true, length: { maximum: 140, minimum: 3 }
    validates :description, presence: true, length: { maximum: 500, minimum: 10}

    def last_comment
      self.comments.order("id ASC").last
    end

    def last_photo
      self.photos.order("id ASC").last
    end
end
