class TimeHolesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_time_hole, only: [:show, :edit, :update, :destroy]

  # GET /time_holes
  # GET /time_holes.json
  def index
    @time_holes = TimeHole.all
    if(params["format"] != "json")
      if(is_admin)
        AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(nil,"Admin Show All TimeHoles"))
      else
        AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(nil,"Failed Show All TimeHoles"))
        render json: {error: "You don't look like an admin to me. Who authorized this? Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs."}, status: 400
      end
    end
  end

  # GET /time_holes/1
  # GET /time_holes/1.json
  def show
    if(is_admin)
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Show One"))
    else
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(nil,"Failed Show One"))
      render json: {error: "You don't look like an admin to me. Who authorized this? Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs."}, status: 400
    end
  end

  def TIMEHOLE
    params.permit(:wigglerJSON, :permanent, :login, :password)
    caretaker = Caretaker.find_by_login(params["login"])
    caretaker = caretaker.authenticate(params["password"])
    id = nil

    if(caretaker.is_banned request.ip)
      #not so silently fail.
      gamzee = '{"pet":"{\"lastPlayed\":\"1542840462569\",\"isempress\":\"false\",\"hatchDate\":\"1542840462569\",\"lastFed\":\"1542840462569\",\"dollDATAURL\":\"Gamzee+Makara%3A___HBRjHbRjHbRBC5Lk5ORBC5J8fHz_uin_uiljHbQAAAAAAAAhISERERFKSkpjHbQ3A23ExMRjHbQxDloIgpBSJ_grYKgVB4PY\",\"boredomJson\":\"0\",\"nameJSON\":\"Gamzee Makara\",\"healthJson\":\"100\",\"TYPE\":\"GRUB\",\"corrupt\":\"false\",\"purified\":\"false\",\"patience\":\"0\",\"idealistic\":\"-113\",\"curious\":\"0\",\"loyal\":\"0\",\"energetic\":\"0\",\"external\":\"0\",\"remembered\":\"{}\",\"rememberedNames\":\"{}\",\"rememberedCastes\":\"{}\"}","breeder":"carcinoGeneticist"}'
      g2 = TimeHole.create(permanent: true , wigglerJSON: gamzee, caretaker_id:1)
      render json: g2.as_json, status: 200
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@new_time_hole,"BANNED CLOWN TRADE, Caretaker: #{caretaker.id}"))
      return
    end

    
    if(caretaker)
      id = caretaker.id
      caretaker.grubs_donated += 1
      caretaker.grubs_adopted += 1

      caretaker.save!
    end



    @chosen_time_hole = TimeHole.randomGrub
    @new_time_hole = TimeHole.new(wigglerJSON: params[:wigglerJSON], permanent: false, caretaker_id: id)

    if(!@new_time_hole.save)
      render json: {error: "Look. No clones. No pupated trolls. Period. I've had too many complaints. Just. Stop. Okay?  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs."}, status: 400
      return
    end
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@new_time_hole,"TIMEHOLE Donate , Caretaker: #{caretaker.id}, Wiggler Name: #{@new_time_hole.name}"))
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@chosen_time_hole,"TIMEHOLE Adopt, Caretaker: #{caretaker.id}, Wiggler Name: #{@chosen_time_hole.name}"))


    if(!@chosen_time_hole.permanent)
      @chosen_time_hole.delete
    end
    render json: @chosen_time_hole.as_json, status: 200

  end

  def timeholesize
    render text: TimeHole.all.count
  end

  #todo this needs to be a post so i can get params
  def adoptTIMEHOLE
    params.permit(:login, :password)
    caretaker = Caretaker.find_by_login(params["login"])
    caretaker = caretaker.authenticate(params["password"])
    id = nil
    if(caretaker)
      id = caretaker.id
      caretaker.grubs_adopted += 1
      caretaker.save!
    end
    @chosen_time_hole = TimeHole.randomGrub

    if(!@chosen_time_hole.permanent)
      @chosen_time_hole.delete
    end
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@chosen_time_hole,"Adopt, Caretaker: #{caretaker.id}, Wiggler Name: #{@chosen_time_hole.name}"))

    render json: @chosen_time_hole.as_json, status: 200

  end

  def abdicateTIMEHOLE
    params.permit(:wigglerJSON, :permanent, :login, :password)
    caretaker = Caretaker.find_by_login(params["login"])
    if(!AllSeeingEye.timehole_accepts_ip? request.ip)
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(caretaker,"Abandon Limit Reached"))
      render json: {error: "In order to stop floods, only #{AllSeeingEye.abandon_limit} grubs per caretaker (calculated based on current conditions) may be callouslly abandoned into the TIMEHOLE every 24 hours.  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs."}, status: 400
      return
    end

    if(caretaker.is_banned request.ip)
      #not so silently fail.
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@new_time_hole,"BANNED CLOWN ABDICATION, Caretaker: #{caretaker.id}"))
      render text: "You. Monster.  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs.", status: 200
      return
    end

    caretaker = caretaker.authenticate(params["password"])
    id = nil
    if(caretaker)
      id = caretaker.id
      caretaker.grubs_donated += 1
      caretaker.save!
    end

    @new_time_hole = TimeHole.new(wigglerJSON: params[:wigglerJSON], permanent: false, caretaker_id: id)
    if(!@new_time_hole.save)
      render json: {error: "Look. No clones. Period. I've had too many complaints. Just. Stop. Okay?  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs."}, status: 400
      return
    end
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@new_time_hole,"Abdicate, Caretaker: #{caretaker.id}, Wiggler Name: #{@new_time_hole.name} "))

    render text: "You monster.  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs.", status: 200
  end

  # GET /time_holes/new
  def new
    @time_hole = TimeHole.new
    respond_to do |format|
      format.html  { render :html => "haha nope, plz dont hax the server  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
      format.json  { render :json => @caretakers }
    end
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"New"))

  end

  # GET /time_holes/1/edit
  def edit
    if(!is_admin)
      respond_to do |format|
        format.html  { render :html => "haha nope, plz dont hax the server  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
        format.json  { render :json => @caretakers }
      end
      AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Edit"))
      end

  end

  # POST /time_holes
  # POST /time_holes.json
  def create
    @time_hole = TimeHole.new(time_hole_params)
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Create"))

    respond_to do |format|
      if @time_hole.save
        format.html { redirect_to @time_hole, notice: "Time hole was successfully created. Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
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
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Update"))
    respond_to do |format|
      if @time_hole.update(time_hole_params)
        format.html { redirect_to @time_hole, notice: "Time hole was successfully updated.  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
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
    AllSeeingEye.create(ip: request.remote_ip, message: AllSeeingEye.create_message(@time_hole,"Destroy"))
    if(!@time_hole.permanent)
      @time_hole.destroy
      respond_to do |format|
        format.html { redirect_to time_holes_url, notice: "Time hole was successfully destroyed.  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to time_holes_url, notice: "Pleaes dont destroy canon grubs  Corruption levels at #{100* Caretaker.number_corruption_sources/@caretakers.count}%. Zampanio stirs." }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_hole
      @time_hole = TimeHole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_hole_params
      params.require(:time_hole).permit(:wigglerJSON, :permanent, :login, :password)
    end


end
