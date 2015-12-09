class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @team_id = params[:team_id]
  end 

  def create
    Team.find(params[:player][:team_id]).players.create(player_params)
    redirect_to(players_path)
  end

  def show
    @player = Player.find(params[:id])
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    redirect_to(players_path)
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    player.update(player_params)
    redirect_to(players_path)
  end

  private

  def player_params
    #permits these elements in the params to be accessed
    params.require(:player).permit(:name, :age, :shirt_number, :gender, :position, :team_id)
  end

end