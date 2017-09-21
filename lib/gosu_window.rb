require 'gosu'

# The Window is the graphical object that handles the I/O of our game. Input and Output goes through the window.
# Here we are using Gosu but hopefully that will be easy to change to something else if you want.
class GosuWindow < Gosu::Window

  def initialize(title, x, y, callbacks)
    super x, y
    self.caption = title
    @callbacks = callbacks
    @main_font = Gosu::Font.new(20)
  end

  def start
    show
  end

  def exit
    close!
  end

  def fps
    Gosu::fps
  end

  # NOTE: Gosu
  # draw is the name Gosu will look for as its render function.
  def draw
    @callbacks[:draw].call
  end

  # NOTE: Gosu
  # update is the name Gosu will look for as its update function.
  def update
    @callbacks[:update].call
  end

  def button_down(id)
    @callbacks[:key_down].call(GosuInputMap::CONSTANT_TO_SYMBOL[id])
  end

  def button_up(id)
    # if id == Gosu::KB_ESCAPE
    #   close
    # else
    #   super
    # end
  end

  def draw_string(string, x, y, z)
    @main_font.draw(string, x, y, z)
  end

end

module GosuInputMap

  include Gosu

  CONSTANT_TO_SYMBOL = {
      Kb0 => [:zero],
      Kb1 => [:one],
      Kb2 => [:two],
      Kb3 => [:three],
      Kb4 => [:four],
      Kb5 => [:five],
      Kb6 => [:six],
      Kb7 => [:seven],
      Kb8 => [:eight],
      Kb9 => [:nine],

      KbBackspace => [:backspace],
      KbDelete    => [:delete, :del],
      KbDown      => [:down_arrow, :down],
      KbEnd       => [:end],
      KbEnter     => [:enter],
      KbEscape    => [:escape, :esc],

      KbHome        => [:home],
      KbInsert      => [:insert, :ins],
      KbLeft        => [:left_arrow, :left],
      KbLeftAlt     => [:left_alt, :lalt],
      KbLeftControl => [:left_control, :left_ctrl, :lctrl],
      KbLeftShift   => [:left_shift, :lshift],
      KbLeftMeta    => [:left_meta, :lmeta],

      KbNumpadAdd       => [:"+", :add, :plus],
      KbNumpadDivide    => [:"/", :divide],
      KbNumpadMultiply  => [:"*", :multiply],
      KbNumpadSubtract  => [:"-", :subtract, :minus],
      KbPageDown        => [:page_down],
      KbPageUp          => [:page_up],
      # KbPause           => [:pause],
      KbReturn          => [:return],
      KbRight           => [:right_arrow, :right],
      KbRightAlt        => [:right_alt, :ralt],
      KbRightControl    => [:right_control, :right_ctrl, :rctrl],
      KbRightShift      => [:right_shift, :rshift],
      KbRightMeta       => [:right_meta, :rmeta],
      KbSpace           => [:" ", :space],
      KbTab             => [:tabulator, :tab],
      KbUp              => [:up_arrow, :up],

      MsLeft            => [:left_mouse_button, :mouse_left],
      MsMiddle          => [:middle_mouse_button, :mouse_middle],
      MsRight           => [:right_mouse_button, :mouse_right],
      MsWheelDown       => [:mouse_wheel_down, :wheel_down],
      MsWheelUp         => [:mouse_wheel_up, :wheel_up],

      GpDown            => [:gamepad_down, :gp_down, :pad_down],
      GpLeft            => [:gamepad_left, :gp_left, :pad_left],
      GpRight           => [:gamepad_right, :gp_right, :pad_right],
      GpUp              => [:gamepad_up, :gp_up, :pad_up]
  }

  # Letters, A-Z
  ("A".."Z").each do |letter|
    CONSTANT_TO_SYMBOL[eval("Kb#{letter}")] = [letter.downcase.to_sym]
  end

  # Numbers, 0-9
  (0..9).each do |number|
    CONSTANT_TO_SYMBOL[eval("Kb#{number.to_s}")] = [number.to_s.to_sym]
  end

  # Numpad-numbers, 0-9
  (0..9).each do |number|
    CONSTANT_TO_SYMBOL[eval("KbNumpad#{number.to_s}")] = ["numpad_#{number.to_s}".to_sym]
  end

  #F-keys, F1-F12
  (1..12).each do |number|
    CONSTANT_TO_SYMBOL[eval("KbF#{number.to_s}")] = ["f#{number.to_s}".to_sym, "F#{number.to_s}".to_sym]
  end

  # Reverse CONSTANT_TO_SYMBOL -> SYMBOL_TO_CONSTANT
  # like: SYMBOL_TO_CONSTANT = CONSTANT_TO_SYMBOL.invert.dup
  SYMBOL_TO_CONSTANT = Hash.new
  CONSTANT_TO_SYMBOL.each_pair do |constant, symbols|
    symbols.each do |symbol|
      SYMBOL_TO_CONSTANT[symbol] = constant
    end
  end
end