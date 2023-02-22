class CarsController < ApplicationController
    def index
    @cars = Car.all
    render json: @cars
  end

  def show
    @cars = Car.find(params[:id])
    render json: @cars
  end
    
  def create
    @cars = Car.new(car_params)
    if @cars.save
    render json: {
      success: 'Car item successfully created'
    },
         status: :created
    else
    render json: {
      error: 'Car item was not created'
    },
         status: :bad_request
    end
  end
  
  def destroy
    @cars = Car.all
    Car.find(params[:id]).destroy!
    render json: @cars
  end
  
  def car_params
    image = Cloudinary::Uploader.upload(params[:image_url])
    params.permit(:car_name, :car_description, :price, :speed, :consumption).merge(image_url: image['url'])
  end
end
