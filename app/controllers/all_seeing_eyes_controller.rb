class AllSeeingEyesController < ApplicationController
  before_action :set_all_seeing_eye, only: [:show, :edit, :update, :destroy]

  # GET /all_seeing_eyes
  # GET /all_seeing_eyes.json
  def index
    if(is_admin)
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Admin All Seeing Eye"))
      @all_seeing_eyes = AllSeeingEye.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).reverse
    else
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(nil,"Failed Admin All Seeing Eye"))
      render json: {error: "You don't look like an admin to me. Who authorized this?"}, status: 400
      return
    end
  end

end
