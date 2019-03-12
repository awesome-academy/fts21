class ActivitiesController < ApplicationController
  def index
    @activities = Activity.newest.includes(:user, :target)
                          .paginate page: params[:page],
                             per_page: Settings.pagination.per_page
  end
end
