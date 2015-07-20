require 'httparty'

class ImagesController < ApplicationController

  def index
    @key = params[:key]

    bananas = HTTParty.post(
      "http://apiimages.herokuapp.com/images",
      query: { "data": { "type": "images", "attributes": { "image-url": "https://imagesapi.s3.amazonaws.com/#{@key}" } } },
      headers: { 'Content-Type' => 'application/vnd.api+json',
                 'Accept' => 'application/vnd.api+json'
                }
    )

    puts bananas.body, bananas.code, bananas.message, bananas.headers.inspect
  end

  def new
  end

  def create
    @caption = params[:caption]

    apples = HTTParty.patch(
      "http://apiimages.herokuapp.com/images/63",
      query: { "data": { "type": "images", "id": "63", "attributes": {"caption": "#{@caption}" } } },
      headers: { 'Content-Type' => 'application/vnd.api+json',
                 'Accept' => 'application/vnd.api+json'
                }
    )

    puts apples.body, apples.code, apples.message, apples.headers.inspect

    redirect_to new_image_path
  end

end
