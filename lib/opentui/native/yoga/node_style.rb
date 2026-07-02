module OpenTUI
  module Native
    module Yoga
      module NodeStyle
        def self.setEnum(node, kind, value)
          Native.yogaNodeStyleSetEnum(node, kind, value)
        end

        def self.getEnum(node, kind)
          Native.yogaNodeStyleGetEnum(node, kind)
        end

        def self.setFloat(node, kind, value)
          Native.yogaNodeStyleSetFloat(node, kind, value)
        end

        def self.getFloat(node, kind)
          Native.yogaNodeStyleGetFloat(node, kind)
        end

        def self.setBorder(node, edge, border)
          Native.yogaNodeStyleSetBorder(node, edge, border)
        end

        def self.getBorder(node, edge)
          Native.yogaNodeStyleGetBorder(node, edge)
        end

        def self.setValue(node, kind, edge_or_gutter, unit, value)
          Native.yogaNodeStyleSetValue(node, kind, edge_or_gutter, unit, value)
        end

        def self.getValue(node, kind, edge_or_gutter) # bigint?
          Native.yogaNodeStyleGetValue(node, kind, edge_or_gutter)
        end
      end
    end
  end
end
