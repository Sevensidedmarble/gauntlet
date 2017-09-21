class Output
  def initialize(window_controller)
    @window_controller = window_controller
  end

  # Draw a string.
  def draw_string(string, x, y, z)
     @window_controller.draw_string(string, x, y, z)
  end
end