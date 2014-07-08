class AboutLayout < MK::Layout
  view :button
  
  def layout
    root :about do
      add UILabel, :title
      add UILabel, :about_blurb
      
      button = add UIButton, :button
      button.on :touch { 'http://foodinspections.org'.nsurl.open }
    end
  end

  def about_style
    background_color '#F9F9F9'.uicolor
  end
  
  def title_style
    text 'Food Inspections'
    text_color UIColor.blackColor
    font UIFont.boldSystemFontOfSize(18)
    size_to_fit
    
    constraints do
      top 30
      left 5
    end
  end
  
  def about_blurb_style
    text 'Visit our website!'
    text_color UIColor.blackColor
    font UIFont.fontWithName('Inconsolata', size: 10)
    size_to_fit
    
    constraints do
      top 90
      left 5
    end
  end
  
  def button_style
    title 'foodinspections.org'
    font UIFont.fontWithName('Inconsolata', size: 10)
    size_to_fit
    
    constraints do
      top 120
      left 5
    end
    
    background_color '#51A8E7'.uicolor
    layer do
      corner_radius 7.0
      shadow_color '#000000'.cgcolor
      shadow_opacity 0.9
      shadow_radius 2.0
      shadow_offset [0, 0]
    end
  end
end