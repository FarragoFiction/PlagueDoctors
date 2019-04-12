class CaretakersController < ApplicationController
  before_action :set_caretaker, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  skip_before_action :verify_authenticity_token

  # GET /caretakers
  # GET /caretakers.json
  def index
    puts "params are #{params}"
    sortby = params["sort"]
    puts "sort is #{sortby} is it an attribute? #{Caretaker.has_attribute? sortby}"
    #if nothing is passed in, default to total_votes
    sortby ||= "total_points"
    @caretakers = Caretaker.all
    if(!Caretaker.method_defined? sortby) && (!Caretaker.has_attribute? sortby)
      #if what is passed in is total gargbage , total votes
      puts "couldn't find #{sortby} so using total points instead"
      sortby ||= "total_points"
    end
    reverse = params["reverse"] == "true"
    puts "reverse is #{reverse}"
    @caretakers = Caretaker.sortShenanigans(@caretakers, sortby,reverse)

  end

  def idFromLogin
    params.permit(:login, :password)
    caretaker = Caretaker.find_by_login(params["login"])
    caretaker = caretaker.authenticate(params["password"])
    id = nil
    if(caretaker)
      render plain: caretaker.id, status: 200
    else
      render plain: "NOPE", status: 404
    end
  end

  def upvote
    @caretaker.good_boi_points += 1
    if(@caretaker.save!)
      render plain: "200", status: 200
    else
      render plain: "500", status: 500
    end
  end

  def downvote
    @caretaker.bad_boi_points += 1
    if(@caretaker.save!)
      render plain: "200", status: 200
    else
      render plain: "500", status: 500
    end
  end
  

  def confirmedLogin
    # Caretaker.find_by_login("yggdrasilsYeoman").authenticate("nidhoggsFavorite")
    initialCaretaker = Caretaker.find_by_login(params["login"])

    if(!initialCaretaker)
      puts "going to create a caretaker"
      Caretaker.create!(name: params["name"], login: params["login"], password: params["password"], desc: params["desc"], doll: params["doll"], good_boi_points: 1, bad_boi_points: 0)
    end

    caretaker = Caretaker.find_by_login(params["login"]).authenticate(params["password"])
    if(caretaker)
      render plain: "200", status: 200
    else
      caretaker = Caretaker.find_by_login(params["login"])
      if(caretaker)
        render plain: "Invalid password for existing login: '#{params['login']}'"
      else
        render plain: "Error Creating User. This is weird and JR thought this would never happen."
      end

    end

  end

  # GET /caretakers/1
  # GET /caretakers/1.json
  def show
  end

  # GET /caretakers/new
  def new
    @caretaker = Caretaker.new
  end

  # GET /caretakers/1/edit
  def edit
  end

  # POST /caretakers
  # POST /caretakers.json
  def create
    @caretaker = Caretaker.new(caretaker_params)

    respond_to do |format|
      if @caretaker.save
        format.html { redirect_to @caretaker, notice: 'Caretaker was successfully created.' }
        format.json { render :show, status: :created, location: @caretaker }
      else
        format.html { render :new }
        format.json { render json: @caretaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caretakers/1
  # PATCH/PUT /caretakers/1.json
  def update
    respond_to do |format|
      if @caretaker.update(caretaker_params)
        format.html { redirect_to @caretaker, notice: 'Caretaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @caretaker }
      else
        format.html { render :edit }
        format.json { render json: @caretaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caretakers/1
  # DELETE /caretakers/1.json
  def destroy
    @caretaker.destroy
    respond_to do |format|
      format.html { redirect_to caretakers_url, notice: 'Caretaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caretaker
      @caretaker = Caretaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caretaker_params
      params.require(:caretaker).permit(:name, :doll, :desc, :good_boi_points, :bad_boi_points, :login, :password_digist)
    end
end
