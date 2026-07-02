module OpenTUI
  class RGBA
    attr_reader :buffer

    def initialize(buffer)
      @buffer = FFI::MemoryPointer.new(:uint16, 4)
      @buffer.put_array_of_uint16(0, buffer.get_array_of_uint16(0, 4))
    end
  end
end
