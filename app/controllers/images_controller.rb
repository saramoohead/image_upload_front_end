require 'httparty'

class ImagesController < ApplicationController

  def index

    @key = params[:key]

    if @key != nil
      image_to_api = HTTParty.post(
        "http://apiimages.herokuapp.com/images",
        query: { "data" => { "type" => "images", "attributes" => { "image-url" => "https://imagesapi.s3.amazonaws.com/#{@key}", "caption" => "  " } } },
        headers: { 'Content-Type' => 'application/vnd.api+json',
                   'Accept' => 'application/vnd.api+json'
                  }
      )

      puts image_to_api.body, image_to_api.code, image_to_api.message, image_to_api.headers.inspect

      if image_to_api.code != 503
        response_from_api = JSON.parse(image_to_api)
        @id = response_from_api["data"]["id"]
        @image_id = @id
      else
        @id = 84
      end

    end

  end

  def new
  end

  def create
    @caption = params[:caption]
    @image_id = params[:image_id]

    caption_to_api = HTTParty.patch(
      "http://apiimages.herokuapp.com/images/#{@image_id}",
      query: { "data" => { "type" => "images", "id" => "#{@image_id}", "attributes" => {"caption" => "#{@caption}" } } },
      headers: { 'Content-Type' => 'application/vnd.api+json',
                 'Accept' => 'application/vnd.api+json'
                }
    )

    puts caption_to_api.body, caption_to_api.code, caption_to_api.message, caption_to_api.headers.inspect

    redirect_to new_image_path
  end

end
