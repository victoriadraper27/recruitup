class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all
  end

  def show
  end
end
