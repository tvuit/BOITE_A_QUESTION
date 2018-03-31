class Question < ApplicationRecord
    belongs_to :user
    validates :title, uniqueness: true, presence: true
    acts_as_votable
    # after_create :broadcast_question
    # after_update :broadcast_question

# def broadcast_question
#     ActionCable.server.broadcast("dynamic_index", {
#       question_partial: ApplicationController.renderer.render(
#               partial: "questions/question",
#               locals: { question: self, user_is_question_author: false }
#         ),
#       })
# end

end
