class VotesController < ApplicationController
  include VotesHelper

  def create
    @activity = Activity.find_by(id: params[:activity_id])
    vote_value = params[:voteType]
    @vote = Vote.new(user: current_user, activity: @activity)
    if vote_value == "down"
      @vote.vote_value = false
      @activity = downvote_activity(@activity)
      @activity.save
    elsif vote_value == "up"
      @vote.vote_value = true
      @activity = upvote_activity(@activity)
      @activity.save
    end
    @vote.save
    render json: Activity.find_by(id: rand(40))
  end

end
