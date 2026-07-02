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
  end
end
