class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :km]
  before_action :lists_selects, only: [:edit, :update, :create, :new]

  #Cancancan
  load_and_authorize_resource
  
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.with_car(current_user).page params[:page]
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: I18n.t('messages.created_with', item: (Car.model_name.human count: 1) ) }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: I18n.t('messages.updated_with', item: (Car.model_name.human count: 1)  )}
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url,  notice: I18n.t('messages.destroyed_with', item: (Car.model_name.human count: 1) )}
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:plate, :mark, :modelType, :functionary_id, :km)
    end
      
    def lists_selects
      @list_functionaries = Functionary.with_functionary(current_user).select(:id, :name)
    end
  
end
