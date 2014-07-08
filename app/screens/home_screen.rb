class HomeScreen < PM::Screen
  title 'Cities'
  
  def on_init
    set_tab_bar_item item: 'Top_Charts.png', title: 'Cities'
  end

  def on_load
    # After view is first loaded
    #set_nav_bar_button :right, title: "Help", action: :show_help
  end

  # def show_help
  #   open HelpScreen
  # end
end
