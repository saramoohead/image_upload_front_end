require 'httparty'

class ImagesController < ApplicationController

  def index
    @key = params[:key]

    bananas = HTTParty.post(
      "http://apiimages.herokuapp.com/images",
      query: { "data": { "type": "images", "attributes": { "image-url": "http://www.railsbob.com/images/image.jpg" } } },
      headers: { 'Content-Type' => 'application/vnd.api+json',
                 'Accept' => 'application/vnd.api+json'
                }
    )

    puts bananas.body, bananas.code, bananas.message, bananas.headers.inspect
  end

  def new
  end

end
