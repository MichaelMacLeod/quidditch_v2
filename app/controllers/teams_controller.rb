class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end 

  def create
    Team.create(team_params)
    redirect_to(teams_path)
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    team = Team.find(params[:id])
    team.destroy
    redirect_to(teams_path)
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    team = Team.find(params[:id])
    team.update(team_params)
    redirect_to(teams_path)
  end

  private

  def team_params
    #permits these elements in the params to be accessed
    params.require(:team).permit(:name, :image, :founded, :mascot, :league, :ground, :last_position)
  end

end