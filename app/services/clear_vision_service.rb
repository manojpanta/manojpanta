require "google/cloud/vision"
class ClearVisionService
  def get_text(file_name)
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    response = image_annotator.text_detection image: file_name
    response.responses.first.text_annotations.first.description
  end
end
