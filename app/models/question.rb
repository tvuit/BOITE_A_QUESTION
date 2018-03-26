class Question < ApplicationRecord
    acts_as_votable
    belongs_to :user
    validates :title, uniqueness: true, presence: true

end
