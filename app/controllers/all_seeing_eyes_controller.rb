class AllSeeingEyesController < ApplicationController
  before_action :set_all_seeing_eye, only: [:show, :edit, :update, :destroy]

  # GET /all_seeing_eyes
  # GET /all_seeing_eyes.json
  def index
    @all_seeing_eyes = AllSeeingEye.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

end
