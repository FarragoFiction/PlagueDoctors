class PaldemicFilesController < ApplicationController
  before_action :set_paldemic_file, only: [:show, :edit, :update, :destroy]

  # GET /paldemic_files
  # GET /paldemic_files.json
  def index
    @paldemic_files = PaldemicFile.all
  end

  # GET /paldemic_files/1
  # GET /paldemic_files/1.json
  def show
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

    respond_to do |format|
      if @paldemic_file.save
        format.html { redirect_to @paldemic_file, notice: 'Paldemic file was successfully created.' }
        format.json { render :show, status: :created, location: @paldemic_file }
      else
        format.html { render :new }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paldemic_files/1
  # PATCH/PUT /paldemic_files/1.json
  def update
    respond_to do |format|
      if @paldemic_file.update(paldemic_file_params)
        format.html { redirect_to @paldemic_file, notice: 'Paldemic file was successfully updated.' }
        format.json { render :show, status: :ok, location: @paldemic_file }
      else
        format.html { render :edit }
        format.json { render json: @paldemic_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paldemic_files/1
  # DELETE /paldemic_files/1.json
  def destroy
    @paldemic_file.destroy
    respond_to do |format|
      format.html { redirect_to paldemic_files_url, notice: 'Paldemic file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paldemic_file
      @paldemic_file = PaldemicFile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paldemic_file_params
      params.require(:paldemic_file).permit(:name, :author, :num_downloads, :num_upvotes, :num_downvotes, :file)
    end
end
