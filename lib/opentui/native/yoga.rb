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

      def self.createMeasureCallback(callback)
      end

      def self.createDirtiedCallback(callback)
      end
    end
  end
end
