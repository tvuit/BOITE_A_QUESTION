class DynamicIndexChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dynamic_index"
  end
end
