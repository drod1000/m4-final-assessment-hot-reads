class Api::V1::LinksController < ApplicationController
  def create
  end

  def link_params
    params.permit(:url)
  end
end
