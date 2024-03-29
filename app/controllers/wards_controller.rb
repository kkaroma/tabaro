class WardsController < ApplicationController
  before_action :set_ward, only: %i[ show edit update destroy ]

  # GET /wards or /wards.json
  def index
    @wards = Ward.all
  end

  # GET /wards/1 or /wards/1.json
  def show
  end

  # GET /wards/new
  def new
    @ward = Ward.new
  end

  # GET /wards/1/edit
  def edit
  end

  # POST /wards or /wards.json
  def create
    @ward = Ward.new(ward_params)

    respond_to do |format|
      if @ward.save
        format.html { redirect_to ward_url(@ward), notice: "Ward was successfully created." }
        format.json { render :show, status: :created, location: @ward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wards/1 or /wards/1.json
  def update
    respond_to do |format|
      if @ward.update(ward_params)
        format.html { redirect_to ward_url(@ward), notice: "Ward was successfully updated." }
        format.json { render :show, status: :ok, location: @ward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wards/1 or /wards/1.json
  def destroy
    @ward.destroy!

    respond_to do |format|
      format.html { redirect_to wards_url, notice: "Ward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ward
      @ward = Ward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ward_params
      params.require(:ward).permit(:ward_name, :division_id)
    end
end
