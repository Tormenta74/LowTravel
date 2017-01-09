class TravelsController < ApplicationController
  before_action :set_travel, only: [:show]
  before_action :set_travel_publish, only: [:publish, :hide] # this is really weird and I don't know how to get the routes to use the :id params
  before_action :authenticate_user!, except: [:show, :index] # with devise method
  # TODO: before_action :authenticate_admin!, only: [:publish, :hide] # with devise method

  # GET /travels
  # GET /travels.json
  def index
    if params[:tag]
      @travels = Travel.published.tagged_with(params[:tag])
      flash[:notice] = "No hay viajes con esta etiqueta." unless @travels
    else
      @travels = Travel.most_recent.published
    end
  end

  # GET /travels/1
  # GET /travels/1.json
  def show
  end

  # GET /travels/new
  def new
    @travel = Travel.new
  end

  # GET /travels/1/edit
  def edit
    @travel = current_user.travels.find_by_id(params[:id])
    redirect_to root_path, alert: 'El artículo referenciado no puede editarse.' unless @travel
  end

  def publish
    @travel.publish
    render :edit
  end

  def hide
    @travel.hide
    render :edit
  end

  # POST /travels
  # POST /travels.json
  def create
    @travel = current_user.travels.new(travel_params)

    respond_to do |format|
      if @travel.save
        format.html { redirect_to @travel, notice: 'Travel was successfully created.' }
        format.json { render :show, status: :created, location: @travel }
      else
        format.html { render :new }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travels/1
  # PATCH/PUT /travels/1.json
  def update
    @travel = current_user.travels.find_by_id(params[:id])
    respond_to do |format|
      if @travel.update(travel_params)
        format.html { redirect_to @travel, notice: 'Travel was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel }
      else
        format.html { render :edit }
        format.json { render json: @travel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travels/1
  # DELETE /travels/1.json
  def destroy
    @travel.destroy
    respond_to do |format|
      format.html { redirect_to travels_url, notice: 'Travel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel
      @travel = Travel.find(params[:id])
    end

    def set_travel_publish
      @travel = Travel.find_by_id(params[:travel_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_params
      params.require(:travel).permit(:title, :content, :facade, :tag_list)
    end
end
