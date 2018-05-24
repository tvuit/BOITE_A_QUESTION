class StoriesController < ApplicationController

  def index
    @stories = policy_scope(Story.all).order(firstPublicationDate: :desc)
.page params[:page]

  end

end
