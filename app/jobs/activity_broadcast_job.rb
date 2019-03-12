class ActivityBroadcastJob < ApplicationJob
  queue_as :default

  def perform activity
    ActionCable.server.broadcast "activities",
      activity: render_activity(activity)
  end

  private

  def render_activity activity
    ApplicationController.renderer.render(partial: "activities/activity",
      locals: {activity: activity})
  end
end
