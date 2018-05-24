class Admin::ImagesController < Admin::BaseController
  before_action :set_image, only: %i[destroy]
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

  def destroy
    @image.destroy
    redirect_to images_path
  end


  private

  def image_params
    params.require(:image).permit(:title, :url)
  end

  def set_image
    @image = Image.find(params[:id])
  end
end
