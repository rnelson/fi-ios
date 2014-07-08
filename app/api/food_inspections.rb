class FoodInspections
  def initialize
    @client = AFMotion::Client.build('http://foodinspections.opennebraska.io/api/v1/') do
      header 'Accept', 'text/html'
      response_serializer :http
    end
  end
  
  def in(lat, lng, radius, &callback)
    url = "firms/in/#{lat}/#{lng}/#{radius}"
    
    @client.get(url) do |result|
      if result.success?
        callback.call BW::JSON.parse result.object
      else
        PM.logger.error result.error.localizedDescription
        callback.call nil
      end
    end
  end
  
  def bbox(top, left, bottom, right, &callback)
    url = "firms/bbox/#{top},#{left},#{bottom},#{right}"
    
    @client.get(url) do |result|
      if result.success?
        callback.call BW::JSON.parse result.object
      else
        PM.logger.error result.error.localizedDescription
        callback.call nil
      end
    end
  end
  
  def in_view(mapview, &callback)
    ne_point = [mapview.bounds.origin.x + mapview.bounds.size.width, mapview.bounds.origin.y]
    sw_point = [mapview.bounds.origin.x, mapview.bounds.origin.y + mapview.bounds.size.height]
    ne_coord = mapview.convertPoint ne_point, toCoordinateFromView:mapview
    sw_coord = mapview.convertPoint sw_point, toCoordinateFromView:mapview
    
    url = "firms/bbox/#{ne_coord.latitude},#{sw_coord.longitude},#{sw_coord.longitude},#{ne_coord.longitude}"
    
    @client.get(url) do |result|
      if result.success?
        callback.call BW::JSON.parse result.object
      else
        PM.logger.error result.error.localizedDescription
        callback.call nil
      end
    end
  end
end