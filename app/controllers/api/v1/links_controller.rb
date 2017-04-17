class Api::V1::LinksController < ApplicationController
  def create
    @link = Link.find_by(url: params[:url])
    if(!@link)
      Link.create(link_params)
      render :nothing => true, :status => 201
    else
      @link.increment!(:read, 1)
      render :nothing => true, :status => 202
    end
  end

  def link_params
    params.permit(:url)
  end
end
