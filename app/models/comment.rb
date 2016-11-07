class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

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

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
end
