class JunglebeatsController < ApplicationController
  def new
  end

  def create
    answer = params[:beats]
    jb = JungleBeat.new
    jb.append(answer)
    jb.play
    redirect_to jungle_beat_path
  end

end
