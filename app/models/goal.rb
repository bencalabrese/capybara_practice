class Goal < ActiveRecord::Base
  validates :user, :body, presence: true

  belongs_to :user
end
