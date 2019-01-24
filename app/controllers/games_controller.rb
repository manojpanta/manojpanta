class GamesController < ApplicationController

  def new
    @cards = Card.all
  end

  def create

  end


end
