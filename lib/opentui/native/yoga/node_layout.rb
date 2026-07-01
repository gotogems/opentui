module OpenTUI
  module Native
    module Yoga
      module NodeLayout
        def self.getEdge(node, kind, edge)
          Native.yogaNodeLayoutGetEdge(node, kind, edge)
        end
      end
    end
  end
end
