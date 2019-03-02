class NightwriterController < ApplicationController

  def new
  end

  def create
    nw = NightWriter.new
    nw.get_braille_string(params[:answer])
    nw.splitting_into_brailles_in_hash
    nw.into_rows
    @translated = nw.braille_splitted_in_lines.map do |t|
      t.split('newline')
    end.flatten
    render :show
  end

  def read
    nightreader = NightReader.new(params[:answer1].split("\r\n"))
    nightreader.put_every_three_string_into_hash
    nightreader.create_braille_string
    nightreader.create_output_string
    @translated1 = nightreader.output_string
    render :show
  end

end
