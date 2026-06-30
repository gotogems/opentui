module OpenTUI
  module ANSI
    HOME  = "\x1b[H"
    RESET = "\x1b[0m"

    RESET_SCROLL_REGION = "\x1b[r"
    RESET_BACKGROUND    = "\x1b[49m"

    SWITCH_TO_MAIN_SCREEN      = "\x1b[?1049l"
    SWITCH_TO_ALTERNATE_SCREEN = "\x1b[?1049h"

    BRACKETED_PASTE_START = "\u001b[200~"
    BRACKETED_PASTE_END   = "\u001b[201~"

    CLEAR_SAVED_LINES = "\x1b[3J"
    CLEAR_SCREEN      = "\x1b[2J"

    def self.scroll_up(lines)
      "\x1b[#{lines}S"
    end

    def self.scroll_down(lines)
      "\x1b[#{lines}T"
    end

    def self.move_cursor(row, col)
      "\x1b[#{row};#{col}H"
    end

    def self.move_cursor_and_clear(row, col)
      "\x1b[#{row};#{col}H\x1b[J"
    end

    def self.set_rgb_background(r, g, b)
      "\x1b[48;2;#{r};#{g};#{b}m"
    end
  end
end
