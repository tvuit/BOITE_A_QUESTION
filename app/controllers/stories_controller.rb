class StoriesController < ApplicationController

  def index
    @stories = policy_scope(Story.all)

  end

end
