#!/usr/bin/env ruby


require 'json'
require 'open-uri'

class Cargo
  def initialize(weight, length, width, height, origin, destination)
    @weight = weight
    @length = length
    @width = width
    @height = height
    @origin = origin
    @destination = destination
  end

  def calculate_distance
     url = "https://api.distancematrix.ai/maps/api/distancematrix/json?origins=#{@origin}&destinations=#{@destination}&key=9hVLU7Y79Oaa5bX3ENP8Hse2lg0g2zA7m10IPM0MoIneGk8T8uv97Gd96hCGMO3W"
     response = JSON.parse(URI.open(url).read)

     distance = response['rows'][0]['elements'][0]['distance']['value'] / 1000.0

     distance.round(2)
  end

  def calculate_price
    volume = @length * @width * @height / 1000000.0

    if volume < 1
      price_per_km = 1
    elsif @weight <= 10
         price_per_km = 2
    else price_per_km = 3
    end

    distance = calculate_distance

    price = distance * price_per_km

    { weight: @weight, length: @length, width: @width, height: @height, distance: distance, price: price }
  end
end
