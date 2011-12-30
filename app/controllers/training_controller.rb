class TrainingController < ApplicationController
  def jumpstartlab
  end

  def malleableinc
  end

  def edgecase
  end

  def thankyou
    @workshop = Workshop.find_by_tag(params[:class])
  end
end
