require_relative 'gosu_window'

class WindowController

  def fps
    @window.fps
  end

  def width
    @window.width
  end

  def height
    @window.height
  end

  def initialize(type, title, x, y, callbacks)
    # the constructor here passes us draw and update callbacks, but we still need to set up input/output callback communication
    # between the window and the WindowController. Then the Input object will set up communication with the WindowController.
    @window_callbacks = callbacks
    @window_callbacks[:key_down] = method(:key_down)
    # Window is the graphical instance in the operating system. It handles I/O.
    case type
      when :gosu
        @window = GosuWindow.new(title, x, y, @window_callbacks)
      else
        @window = GosuWindow.new(title, x, y, @window_callbacks)
    end

    # these IO callbacks are used for communication between the window controller and the IO objects.
    @io_callbacks = Hash.new
  end

  def set_io_callback(symbol, callback)
    @io_callbacks[symbol] = callback
  end

  def exit
    @window.exit
  end

  def start
    @window.start
  end

  ## ------------------ ##
  ## BEGIN INPUT FUNCTIONS
  ## BEGIN INPUT FUNCTIONS
  def key_down(key)
    if @io_callbacks[:key_down].nil?
      $log.error("Input: key_down callback is not set!")
    else
      @io_callbacks[:key_down].call(key)
    end
  end
  ## END INPUT FUNCTIONS
  ## END INPUT FUNCTIONS
  ## ---------------- ##

  ## ------------------- ##
  ## BEGIN OUTPUT FUNCTIONS
  ## BEGIN OUTPUT FUNCTIONS
  def draw_string(string, x, y, z)
    @window.draw_string(string, x, y, z)
  end
  ## END OUTPUT FUNCTIONS
  ## END OUTPUT FUNCTIONS
  ## ----------------- ##

end

