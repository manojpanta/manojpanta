# require 'uri'
# require 'image'
require "google/cloud/vision"

class ClearVisionService
  def get_text(file_name)
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    response = image_annotator.text_detection image: file_name
    response.responses.first.text_annotations.first.description
  end
end

##using api key

# binding.pry
# api_key = ENV["GOOGLE-VISION-API"]
# url = "https://vision.googleapis.com/v1/images:annotate?key=#{api_key}"
# uri = URI.join('file:///', file_name)
# uri.scheme
# uri.path
# uri.to_s
#
#
# body = {
#   "requests": [
#     {
#       "features": [
#         {
#           "type": "text_detection"
#         }
#       ],
#       "image": {
#         "source": {
#           "imageUri": uri
#         }
#       }
#     }
#   ]
# }
# binding.pry
# response = Faraday.post(url) do |req|
#   req.headers["Content-Type"] = "application/json"
#   req.body = body.to_json
# end
# binding.pry
# response.body
