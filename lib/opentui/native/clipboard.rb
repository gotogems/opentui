module OpenTUI
  module Native
    class Clipboard
      CLIPBOARD = 0
      PRIMARY   = 1
      SELECT    = 2
      SECONDARY = 3

      def initialize(renderer_ptr)
        @renderer_ptr = renderer_ptr
      end

      def copy_to_clipboard_osc52(text, target)
        if osc52_supported?
          text_utf8 = Native.encoder.encode(text)
          Native.copyToClipboardOSC52(@renderer_ptr, target, textUtf8)
        else
          false
        end
      end

      def clear_clipboard_osc52(target)
        if osc52_supported?
          Native.clearClipboardOSC52(@renderer_ptr, target)
        else
          false
        end
      end

      def osc52_supported?
        caps = Native.getTerminalCapabilities(@renderer_ptr)
        caps&.osc52_support != "unsupported"
      end
    end
  end
end
