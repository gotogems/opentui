module OpenTUI
  module Native
    module Yoga
      module Config
        def self.create
          Native.yogaConfigCreate() or
            raise 'Failed to create Yoga config'
        end

        def self.free(config)
          Native.yogaConfigFree(config)
        end

        def self.setUseWebDefaults(config, enabled)
          Native.yogaConfigSetUseWebDefaults(config, enabled)
        end

        def self.getUseWebDefaults(config)
          Native.yogaConfigGetUseWebDefaults(config)
        end

        def self.setPointScaleFactor(config, point_scale_factor)
          Native.yogaConfigSetPointScaleFactor(config, point_scale_factor)
        end

        def self.getPointScaleFactor(config)
          Native.yogaConfigGetPointScaleFactor(config)
        end

        def self.setErrata(config, errata)
          Native.yogaConfigSetErrata(config, errata)
        end

        def self.getErrata(config)
          Native.yogaConfigGetErrata(config)
        end

        def self.setExperimentalFeatureEnabled(config, feature, enabled)
          Native.yogaConfigSetExperimentalFeatureEnabled(config, feature, enabled)
        end

        def self.isExperimentalFeatureEnabled(config, feature)
          Native.yogaConfigIsExperimentalFeatureEnabled(config, feature)
        end
      end
    end
  end
end
