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
    fi = FoodInspections.new
    fi.in_view(mapview) do |result|
      result.each do |firm|
        ann = {
          :longitude => firm['lng'].to_f,
          :latitude => firm['lat'].to_f,
          :title => firm['name'],
          :subtitle => "Critical: #{firm['total_critical'].to_s}, Noncritical: #{firm['total_noncritical'].to_s}",
          :image => UIImage.imageNamed('yellow-small')
        }
        add_annotation ann
      end
    end

    update_annotation_data
  end

  def annotation_data
    []
  end
end