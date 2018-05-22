class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "#{@image.title} has been Created!"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to images_path
  end


  private

  def image_params
    params.require(:image).permit(:title, :url)
  end
end
