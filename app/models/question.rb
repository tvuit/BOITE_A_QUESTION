class Question < ApplicationRecord
    belongs_to :user
    validates :title, uniqueness: true, presence: true
    acts_as_votable

end
