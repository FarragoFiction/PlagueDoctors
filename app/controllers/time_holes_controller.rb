class TimeHolesController < ApplicationController
  before_action :set_time_hole, only: [:show, :edit, :update, :destroy]

  # GET /time_holes
  # GET /time_holes.json
  def index
    @time_holes = TimeHole.all
  end

  # GET /time_holes/1
  # GET /time_holes/1.json
  def show
  end

  def TIMEHOLE
    params.permit(:wigglerJSON, :permanent)

    @chosen_time_hole = TimeHole.randomGrub
    @new_time_hole = TimeHole.create(wigglerJSON: params[:wigglerJSON], permanent: false)


    if(!@chosen_time_hole.permanent)
      @chosen_time_hole.delete
    end
    render json: @chosen_time_hole.as_json, status: 200

  end

  def timeholesize
    return TimeHole.all.count
  end

  def adoptTIMEHOLE
    @chosen_time_hole = TimeHole.randomGrub

    if(!@chosen_time_hole.permanent)
      @chosen_time_hole.delete
    end
    render json: @chosen_time_hole.as_json, status: 200

  end

  def abdicateTIMEHOLE
    params.permit(:wigglerJSON, :permanent)
    @new_time_hole = TimeHole.create(wigglerJSON: params[:wigglerJSON], permanent: false)

    render text: "You monster.", status: 200
  end

  # GET /time_holes/new
  def new
    @time_hole = TimeHole.new
  end

  # GET /time_holes/1/edit
  def edit
  end

  # POST /time_holes
  # POST /time_holes.json
  def create
    @time_hole = TimeHole.new(time_hole_params)

    respond_to do |format|
      if @time_hole.save
        format.html { redirect_to @time_hole, notice: 'Time hole was successfully created.' }
        format.json { render :show, status: :created, location: @time_hole }
      else
        format.html { render :new }
        format.json { render json: @time_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_holes/1
  # PATCH/PUT /time_holes/1.json
  def update
    respond_to do |format|
      if @time_hole.update(time_hole_params)
        format.html { redirect_to @time_hole, notice: 'Time hole was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_hole }
      else
        format.html { render :edit }
        format.json { render json: @time_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_holes/1
  # DELETE /time_holes/1.json
  def destroy
    @time_hole.destroy
    respond_to do |format|
      format.html { redirect_to time_holes_url, notice: 'Time hole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_hole
      @time_hole = TimeHole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_hole_params
      params.require(:time_hole).permit(:wigglerJSON, :permanent)
    end
end
