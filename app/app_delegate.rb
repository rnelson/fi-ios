class AppDelegate < PM::Delegate
  status_bar true, animation: :none

  def on_load(app, options)
    return true if RUBYMOTION_ENV == 'test'
    open_tab_bar HomeScreen, MappingScreen, AboutScreen
    open_tab 'Map'
  end

end
