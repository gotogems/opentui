require 'opentui/native/yoga/config'
require 'opentui/native/yoga/node'
require 'opentui/native/yoga/node_layout'
require 'opentui/native/yoga/node_style'

module OpenTUI
  module Native
    module Yoga
      def self.storeMeasureResult(width, height)
        Native.yogaStoreMeasureResult(width, height)
      end

      # [NativeYogaMeasureCallback] -> FFICallbackInstance
      def self.createMeasureCallback(callback)
        FFI::Function.new(:void, [:pointer, :float, :uint32, :float, :uint32]) {}
      end

      # [NativeYogaDirtiedCallback] -> FFICallbackInstance
      def self.createDirtiedCallback(callback)
        FFI::Function.new(:void, []) {}
      end
    end
  end
end
