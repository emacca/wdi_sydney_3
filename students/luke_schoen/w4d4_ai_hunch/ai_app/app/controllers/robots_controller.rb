#require './lib/classes/robotrandom.rb'

class RobotsController < ApplicationController
  http_basic_authenticate_with name: "username", password: "password"
  #, except: :index
  before_action :set_robot, only: [:show, :edit, :update, :destroy]

  # GET /robots
  # GET /robots.json
  def index
    @robots = Robot.all
  end

  # GET /robots/1
  # GET /robots/1.json
  def show
  end

  # GET /robots/new
  def new
    @robot = Robot.new

	@robot.image = nil

  	#<%#  robot_random = Robotrandom.new %>
  	#<%#  @robot_random_name = robot_random.make_new(@robot.id, nil).to_s %>
  	#<%#  @robot_random_name = robot_random.make_new.to_s %>

  	@robot_random_name = ('A'..'Z').to_a.sample(3).join + rand(10000...999999).to_s

	@robot.image = "http://robohash.org/" + @robot_random_name 
	#"?bgset=bg1"

  end

  # GET /robots/1/edit
  def edit
  end

  # POST /robots
  # POST /robots.json
  def create
    @robot = Robot.new(robot_params)

    respond_to do |format|
      if @robot.save
        format.html { redirect_to @robot, notice: 'Robot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @robot }
      else
        format.html { render action: 'new' }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /robots/1
  # PATCH/PUT /robots/1.json
  def update
    respond_to do |format|
      if @robot.update(robot_params)
        format.html { redirect_to @robot, notice: 'Robot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @robot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /robots/1
  # DELETE /robots/1.json
  def destroy
    @robot.destroy
    respond_to do |format|
      format.html { redirect_to robots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_robot
      @robot = Robot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def robot_params
      params.require(:robot).permit(:name, :description, :image)
    end
end
