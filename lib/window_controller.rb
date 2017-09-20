require_relative 'gosu_window'

class WindowController
  def initialize(type, title, x, y, callbacks)
    # the constructor here passes us draw and update callbacks, but we still need to set up input/output callback communication
    # between the window and the WindowController. Then the Input object will set up communication with the WindowController.
    @callbacks = callbacks
    @callbacks[:key_down] = method(:key_down)
    # Window is the graphical instance in the operating system. It handles I/O.
    case type
      when :gosu
        @window = GosuWindow.new(title, x, y, @callbacks)
      else
        @window = GosuWindow.new(title, x, y, @callbacks)
    end

    # these IO callbacks are used for communication between the window controller and the IO objects.
    @input_callbacks = Hash.new
    @output_callbacks = Hash.new
  end

  def start
    @window.start
  end

  def set_input_callback(symbol, callback)
    @input_callbacks[symbol] = callback
  end

  def key_down(key)
    if @input_callbacks[:key_down].nil?
      $log.error("Input: key_down callback is not set!")
    else
      @input_callbacks[:key_down].call(key)
    end
  end
end