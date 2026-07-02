module OpenTUI
  module Native
    module Link
      def self.alloc(url)
        buf = FFI::MemoryPointer.new(:uint8, url.bytesize)
        buf.put_bytes(0, url)
        Native.linkAlloc(buf, url.bytesize)
      end

      def self.getUrl(link_id, max_len = 512)
        buf = FFI::MemoryPointer.new(:uint8, max_len)
        bytesize = Native.linkGetUrl(link_id, buf, max_len)
        buf.get_bytes(0, bytesize)
      end

      module Attributes
        def self.withLink(baseAttributes, link_id)
          Native.attributesWithLink(baseAttributes, link_id)
        end

        def self.getLinkId(attributes)
          Native.attributesGetLinkId(attributes)
        end
      end
    end
  end
end
