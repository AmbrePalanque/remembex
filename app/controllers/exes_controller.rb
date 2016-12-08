class ExesController < ApplicationController
  before_action :authorize
  before_action :set_ex, only: [:show, :edit, :update, :destroy]

  # GET /exes
  # GET /exes.json
  def index
    @exes = current_user.exes
  end

  # GET /exes/1
  # GET /exes/1.json
  def show
  end

  # GET /exes/new
  def new
    @ex = Ex.new
  end

  # GET /exes/1/edit
  def edit
    unless @ex.user.id == current_user.id
    redirect_to root_path
    end

  end

  # POST /exes
  # POST /exes.json
  def create
    @ex = Ex.new(ex_params)

    @ex.user = current_user

    respond_to do |format|
      if @ex.save
        format.html { redirect_to @ex, notice: 'Ex was successfully created.' }
        format.json { render :show, status: :created, location: @ex }
      else
        format.html { render :new }
        format.json { render json: @ex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exes/1
  # PATCH/PUT /exes/1.json
  def update
    if @ex.user.id == current_user.id
      respond_to do |format|
        if @ex.update(ex_params)
          format.html { redirect_to @ex, notice: 'Ex was successfully updated.' }
          format.json { render :show, status: :ok, location: @ex }
        else
          format.html { render :edit }
          format.json { render json: @ex.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
    end
  end

  # DELETE /exes/1
  # DELETE /exes/1.json
  def destroy
    if @ex.user.id == current_user.id
      @ex.destroy
      respond_to do |format|
        format.html { redirect_to exes_url, notice: 'Ex was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ex
      @ex = Ex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ex_params
      params.require(:ex).permit(:image, :name, :note_sex, :note_gentilesse, :note_humour, :numero, :point_positif, :point_negatif, :description)
    end
end
