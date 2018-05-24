class StoriesController < ApplicationController

  def index
    @stories = policy_scope(Story.all).page params[:page]

  end

end
