class ResumeController < ApplicationController
  before_action :set_category, only: %i[edit show destroy update]

  def index
  end
end
