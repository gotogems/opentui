module OpenTUI
  module Native
    class YogaLayout < FFI::Struct
      layout :left,   :float,
             :top,    :float,
             :right,  :float,
             :bottom, :float,
             :width,  :float,
             :height, :float
    end

    class GridDrawOptions < FFI::Struct
      layout :draw_inner, :bool,
             :draw_outer, :bool
    end
  end
end
