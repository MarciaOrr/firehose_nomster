class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  RATINGS = {
    '*'          => '1_star',
    '* *'        => '2_star',
    '* * *'      => '3_star',
    '* * * *'    => '4_star',
    '* * * * *'  => '5_star',
  }

  def humanized_rating
    RATINGS.invert[self.rating]
  end
end
