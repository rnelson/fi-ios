class MappingScreen < PM::MapScreen
  title 'Map'
  start_position latitude: 40.83, longitude: -96.66, radius: 10
  
  def on_init
    set_tab_bar_item item: 'Map_Path.png', title: 'Map'
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
end
