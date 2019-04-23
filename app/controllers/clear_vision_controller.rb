class ClearVisionController < ApplicationController
  def index
    @image = Image.new
  end

  def show
    if !params['image']
      redirect_to root_path, alert: "Please Choose a File and Try Again!!"
    else
      image = Image.create(image_params)
      url = "./public" + image.avatar.url.split("?").first
      this = ClearVisionService.new.get_text(url)
      render :show, :locals => {:pic => this.split("\n")}
      image.destroy
    end
  end

  private
  def image_params
    params.require(:image).permit(:avatar)
  end
end
