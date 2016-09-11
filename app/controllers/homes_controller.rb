class HomesController < ApplicationController
  def index
    @countries ||= Country.all
  end
end
