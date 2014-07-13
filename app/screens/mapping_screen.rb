class MappingScreen < PM::MapScreen
  title 'Map'
  start_position latitude: 40.83, longitude: -96.66, radius: 10
  
  def on_init
    set_tab_bar_item item: 'Map_Path.png', title: 'Map'
    show_user_location
  end
  
  def on_appear
    get_new_annotations
  end
  
  def get_new_annotations
    annotations = Array.new
    clear_annotations
    
    FIFirm.loadWithinMapView(mapview).each do |firm|
      annotation = {
        :title => firm.name,
        :subtitle => "Critical: #{firm.totalCritical.to_s}, Noncritical: #{firm.totalNoncritical.to_s}",
        :latitude => firm.coordinate.latitude,
        :longitude => firm.coordinate.longitude,
        :image => UIImage.imageNamed('yellow-small')
      }
      annotations << annotation
    end
    
    add_annotations annotations
  end

  def annotation_data
    []
  end
  
  def on_user_location(location)
    zoom_to_user
    get_new_annotations
  end
  
  def mapView(view, regionDidChangeAnimated:animated)
    get_new_annotations
  end
  
  def mapView(view, didFailToLocateUserWithError:error)
    position = CLLocationCoordinate2D.new
    position.latitude = 40.83
    position.longitude = -96.66
    
    center = position
  end
end
