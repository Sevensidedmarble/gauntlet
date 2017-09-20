class Output
  def initialize(window_controller)
    @window_controller = window_controller
  end

  # The main render loop which gets passed to the Window instance in Game.
  def render

  end

  # Draw a string.
  def draw_string(string, x, y, z)
    @window.draw_string(string, x, y, z)
  end
end