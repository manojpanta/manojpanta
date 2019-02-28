class GamesController < ApplicationController

  def new
  end
  def create
    @notice = CardRunner.start(params[:Credit_Card_Number])
    render :show
  end
end
