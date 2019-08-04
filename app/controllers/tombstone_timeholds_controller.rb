class TombstoneTimeholdsController < ApplicationController
  before_action :set_tombstone_timehold, only: [:show, :edit, :update, :destroy, :upvote, :downvote,:updateFromLOMAT]

  # GET /tombstone_timeholds
  # GET /tombstone_timeholds.json
  def index
    @tombstone_timeholds = TombstoneTimehold.all
  end

  # GET /tombstone_timeholds/1
  # GET /tombstone_timeholds/1.json
  def show
  end

  # GET /tombstone_timeholds/new
  def new
    @tombstone_timehold = TombstoneTimehold.new
  end

  # GET /tombstone_timeholds/1/edit
  def edit
  end

  # POST /tombstone_timeholds
  # POST /tombstone_timeholds.json
  def create
    @tombstone_timehold = TombstoneTimehold.new(tombstone_timehold_params)

    respond_to do |format|
      if @tombstone_timehold.save
        format.html { redirect_to @tombstone_timehold, notice: 'Tombstone timehold was successfully created.' }
        format.json { render :show, status: :created, location: @tombstone_timehold }
      else
        format.html { render :new }
        format.json { render json: @tombstone_timehold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tombstone_timeholds/1
  # PATCH/PUT /tombstone_timeholds/1.json
  def update
    respond_to do |format|
      if @tombstone_timehold.update(tombstone_timehold_params)
        format.html { redirect_to @tombstone_timehold, notice: 'Tombstone timehold was successfully updated.' }
        format.json { render :show, status: :ok, location: @tombstone_timehold }
      else
        format.html { render :edit }
        format.json { render json: @tombstone_timehold.errors, status: :unprocessable_entity }
      end
    end
  end

  def createFromLOMAT
    @tombstone_timehold = TombstoneTimehold.new(tombstone_timehold_params_from_lomat)

    respond_to do |format|
      if @tombstone_timehold.save
        format.html { redirect_to @tombstone_timehold, notice: 'Tombstone timehold was successfully created.' }
        format.json { render :show, status: :created, location: @tombstone_timehold }
      else
        format.html { render :new }
        format.json { render json: @tombstone_timehold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tombstone_timeholds/1
  # PATCH/PUT /tombstone_timeholds/1.json
  def updateFromLOMAT
    respond_to do |format|
      if @tombstone_timehold.update(tombstone_timehold_params_from_lomat)
        format.html { redirect_to @tombstone_timehold, notice: 'Tombstone timehold was successfully updated.' }
        format.json { render :show, status: :ok, location: @tombstone_timehold }
      else
        format.html { render :edit }
        format.json { render json: @tombstone_timehold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tombstone_timeholds/1
  # DELETE /tombstone_timeholds/1.json
  def destroy
    @tombstone_timehold.destroy
    respond_to do |format|
      format.html { redirect_to tombstone_timeholds_url, notice: 'Tombstone timehold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @tombstone_timehold.rating ||= 0
    @tombstone_timehold.rating += 1
    if(@tombstone_timehold.save!)
      render plain: "200", status: 200
    else
      render plain: "500", status: 500
    end
  end

  def downvote
    @tombstone_timehold.rating ||= 0
    @tombstone_timehold.rating += -1
    if(@tombstone_timehold.save!)
      render plain: "200", status: 200
    else
      render plain: "500", status: 500
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tombstone_timehold
      @tombstone_timehold = TombstoneTimehold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def tombstone_timehold_params
    params.require(:tombstone_timehold).permit(:tombstoneJSON, :permanent, :rating)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tombstone_timehold_params_from_lomat
    params.permit(:tombstoneJSON, :permanent, :rating)
  end
end
