class PaldemicFilesController < ApplicationController
  before_action :set_paldemic_file, only: [:show, :edit, :update, :destroy, :downvote, :upvote]

  #should be an update, with an id....hrrm, how to route?
  def downvote
    @paldemic_file.num_downvotes +=1
    respond_to do |format|
      if(@paldemic_file.save)
        format.html { redirect_to paldemic_files_url, notice: 'Down Vote tallied :)' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end

  end

  def upvote
    @paldemic_file.num_upvotes +=1
    respond_to do |format|
      if(@paldemic_file.save)
        format.html { redirect_to paldemic_files_url, notice: 'Up Vote tallied :)' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /paldemic_files
  # GET /paldemic_files.json
  def index
    @paldemic_files = PaldemicFile.all
  end

  # GET /paldemic_files/1
  # GET /paldemic_files/1.json
  def show
    puts "The password is #{@paldemic_file.pw}"
  end

  # GET /paldemic_files/new
  def new
    @paldemic_file = PaldemicFile.new
  end

  # GET /paldemic_files/1/edit
  def edit
  end

  # POST /paldemic_files
  # POST /paldemic_files.json
  def create
    @paldemic_file = PaldemicFile.new(paldemic_file_params)

    if(paldemic_file_params["file"] != nil)
      @paldemic_file.file = paldemic_file_params["file"].read
      validFile = PaldemicFile.validFile?(@paldemic_file.file)
    else
      validFile = false
    end

    respond_to do |format|
      if validFile && @paldemic_file.save
        format.html { redirect_to @paldemic_file, notice: 'Paldemic file was successfully created.' }
        format.json { render :show, status: :created, location: @paldemic_file }
      else
        if(!validFile)
          @paldemic_file.errors.add(:file)
        end
        format.html { render :new }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paldemic_files/1
  # PATCH/PUT /paldemic_files/1.json
  def update
    respond_to do |format|
      puts "i found a password of #{ paldemic_file_params["pw"]} and my saved pw is #{@paldemic_file.pw}"
      if(paldemic_file_params["file"] != nil)
        validFile = PaldemicFile.validFile?(paldemic_file_params["file"].read)
      else
        validFile = false
      end

      if paldemic_file_params["pw"] == @paldemic_file.pw && validFile && @paldemic_file.update(paldemic_file_params)
        #do it post update
        @paldemic_file.file = paldemic_file_params["file"].read
        @paldemic_file.save()
        format.html { redirect_to @paldemic_file, notice: 'Paldemic file was successfully updated.' }
        format.json { render :show, status: :ok, location: @paldemic_file }
      else
        if paldemic_file_params["pw"] != @paldemic_file.pw
          @paldemic_file.errors.add(:pw)
        end
        if(!validFile)
          @paldemic_file.errors.add(:file)
        end
        puts "error is #{@paldemic_file.errors}"
        format.html { render :edit }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paldemic_files/1
  # DELETE /paldemic_files/1.json
  def destroy
    if paldemic_file_params["pw"] == @paldemic_file.pw

      @paldemic_file.destroy
      respond_to do |format|
        format.html { redirect_to paldemic_files_url, notice: 'Paldemic file was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      @paldemic_file.errors.add(:pw)
      format.html { render :edit }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paldemic_file
      @paldemic_file = PaldemicFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paldemic_file_params
      params.require(:paldemic_file).permit(:name, :author, :num_downloads, :num_upvotes, :num_downvotes, :file, :pw)
    end
end
