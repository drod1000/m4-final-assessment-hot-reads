class LinksController < ApplicationController
  def index
    @links = Link.top10
  end
end
