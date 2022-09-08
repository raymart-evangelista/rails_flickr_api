class StaticPagesController < ApplicationController
  def home
    flickr = Flickr.new ENV["FLICKR_KEY"], ENV["FLICKR_SECRET"]

    if params[:flickr_id]
      id = params[:flickr_id]

      begin
        @photos_raw = flickr.people.getPhotos user_id: id
        @links = Array.new

        @photos_raw.length.times do |i|
          @links << "https://live.staticflickr.com/#{@photos_raw[i].server}/#{@photos_raw[i].id}_#{@photos_raw[i].secret}.jpg"
        end
      rescue StandardError => e
        flash.now[:notice] = e
      end
    end
  end
end
