class AboutScreen < PM::Screen
  title 'About'

  def on_init
    set_tab_bar_item item: 'Signpost.png', title: 'About'
  end

  def on_load
    @layout = AboutLayout.new(root: self.view).build
  end
end