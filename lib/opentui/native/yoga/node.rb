module OpenTUI
  module Native
    module Yoga
      module Node
        def self.create
          Native.yogaNodeCreate() or
            raise 'Failed to create Yoga node'
        end

        def self.createForOpenTUI
          Native.yogaNodeCreateForOpenTUI() or
            raise 'Failed to create OpenTUI Yoga node'
        end

        def self.createWithConfig(config)
          Native.yogaNodeCreateWithConfig(config) or
            raise 'Failed to create Yoga node'
        end

        def self.free(node)
          Native.yogaNodeFree(node)
        end

        def self.freeRecursive(node)
          Native.yogaNodeFreeRecursive(node)
        end

        def self.reset(node)
          Native.yogaNodeReset(node)
        end

        def self.copyStyle(dst_node, src_node)
          Native.yogaNodeCopyStyle(dst_node, src_node)
        end

        def self.insertChild(node, child, index)
          Native.yogaNodeInsertChild(node, child, index)
        end

        def self.removeChild(node, child)
          Native.yogaNodeRemoveChild(node, child)
        end

        def self.removeAllChildren(node)
          Native.yogaNodeRemoveAllChildren(node)
        end

        def self.getChild(node, index)
          Native.yogaNodeGetChild(node, index) or nil
        end

        def self.getChildCount(node)
          Native.yogaNodeGetChildCount(node)
        end

        def self.getParent(node)
          Native.yogaNodeGetParent(node) or nil
        end

        def self.isDirty(node)
          Native.yogaNodeIsDirty(node)
        end

        def self.markDirty(node)
          Native.yogaNodeMarkDirty(node)
        end

        def self.setHasNewLayout(node, has_new_layout)
          Native.yogaNodeSetHasNewLayout(node, has_new_layout)
        end

        def self.getHasNewLayout(node)
          Native.yogaNodeGetHasNewLayout(node)
        end

        def self.calculateLayout(node, width, height, direction)
          Native.yogaNodeCalculateLayout(node, width, height, direction)
        end

        def self.getComputedLayout(node)
          layout = FFI::MemoryPointer.new(:float, 6)
          Native.yogaNodeGetComputedLayout(node, layout)
          YogaLayout.new(layout)
        end

        def self.isReferenceBaseline(node)
          Native.yogaNodeIsReferenceBaseline(node)
        end

        def self.setIsReferenceBaseline(node, is_reference_baseline)
          Native.yogaNodeSetIsReferenceBaseline(node, is_reference_baseline)
        end

        def self.setAlwaysFormsContainingBlock(node, always_forms_containing_block)
          Native.yogaNodeSetAlwaysFormsContainingBlock(node, always_forms_containing_block)
        end

        def self.getAlwaysFormsContainingBlock(node)
          Native.yogaNodeGetAlwaysFormsContainingBlock(node)
        end

        def self.setMeasureFunc(node, callback)
          Native.yogaNodeSetMeasureFunc(node, callback)
        end

        def self.unsetMeasureFunc(node)
          Native.yogaNodeUnsetMeasureFunc(node)
        end

        def self.hasMeasureFunc(node)
          Native.yogaNodeHasMeasureFunc(node)
        end

        def self.setDirtiedFunc(node, callback)
          Native.yogaNodeSetDirtiedFunc(node, callback)
        end

        def self.unsetDirtiedFunc(node)
          Native.yogaNodeUnsetDirtiedFunc(node)
        end
      end
    end
  end
end
