require 'rails_helper'
describe 'model' do
  it 'gets text' do
    service = ClearVisionService.new
    result = service.get_text

    expect(result).to be_a(String)
  end
end
