class Question < ApplicationRecord
    belongs_to :user
    acts_as_votable
    validates :title, uniqueness: true, presence: true

end
