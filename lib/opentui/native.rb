module OpenTUI
  module Native
    extend FFI::Library

    ffi_lib Path.ffi_lib

    attach_function :createRenderer,  [:uint32, :uint32, :uint8, :uint8, :pointer], :uint32
    attach_function :resizeRenderer,  [:uint32, :uint32, :uint32], :void
    attach_function :resumeRenderer,  [:uint32], :void
    attach_function :suspendRenderer, [:uint32], :void
    attach_function :destroyRenderer, [:uint32], :void

    attach_function :setupTerminal,     [:uint32, :bool], :void
    attach_function :setTerminalTitle,  [:uint32, :pointer, :uint32], :void
    attach_function :setTerminalEnvVar, [:uint32, :pointer, :uint32, :pointer, :uint32], :bool

    attach_function :getTerminalCapabilities, [:uint32, :pointer], :void
    attach_function :restoreTerminalModes,    [:uint32], :void
    attach_function :clearTerminal,           [:uint32], :void

    attach_function :setCursorColor,    [:uint32, :pointer], :void
    attach_function :setCursorPosition, [:uint32, :int32, :int32, :bool], :void
    attach_function :setCursorStyleOptions, [:uint32, :pointer], :void
    attach_function :getCursorState,        [:uint32, :pointer], :void

    attach_function :enableMouse,  [:uint32, :bool], :void
    attach_function :disableMouse, [:uint32], :void

    attach_function :queryThemeColors,     [:uint32], :void
    attach_function :queryPixelResolution, [:uint32], :void

    attach_function :getNextBuffer,    [:uint32], :uint32
    attach_function :getCurrentBuffer, [:uint32], :uint32
    attach_function :getBufferWidth,   [:uint32], :uint32
    attach_function :getBufferHeight,  [:uint32], :uint32

    attach_function :bufferGetCharPtr, [:uint32], :pointer
    attach_function :bufferGetBgPtr,   [:uint32], :pointer
    attach_function :bufferGetFgPtr,   [:uint32], :pointer
    attach_function :bufferClear,      [:uint32, :pointer], :void

    attach_function :bufferSetRespectAlpha, [:uint32, :bool], :void
    attach_function :bufferGetRespectAlpha, [:uint32], :bool
    attach_function :bufferGetRealCharSize, [:uint32], :uint32

    attach_function :bufferGetAttributesPtr, [:uint32], :pointer
    attach_function :bufferGetId,            [:uint32, :pointer, :uint32], :uint32

    attach_function :bufferDrawChar, [:uint32, :uint32, :uint32, :uint32, :pointer, :pointer, :uint32], :void
    attach_function :bufferDrawText, [:uint32, :pointer, :uint32, :uint32, :uint32, :pointer, :pointer, :uint32], :void
    attach_function :bufferDrawGrid, [:uint32, :pointer, :pointer, :pointer, :pointer, :uint32, :pointer, :uint32, :pointer], :void
    attach_function :bufferDrawBox,  [:uint32, :int32, :int32, :uint32, :uint32, :pointer, :uint32, :pointer, :pointer, :pointer, :pointer, :uint32, :pointer, :uint32], :void
    attach_function :bufferFillRect, [:uint32, :uint32, :uint32, :uint32, :uint32, :pointer], :void

    attach_function :bufferResize, [:uint32, :uint32, :uint32], :void
    attach_function :bufferWriteResolvedChars, [:uint32, :pointer, :uint32, :bool], :uint32

    attach_function :bufferSetCell, [:uint32, :uint32, :uint32, :uint32, :pointer, :pointer, :uint32], :void
    attach_function :bufferSetCellWithAlphaBlending, [:uint32, :uint32, :uint32, :uint32, :pointer, :pointer, :uint32], :void

    attach_function :bufferColorMatrix, [:uint32, :pointer, :pointer, :uint32, :float, :uint8], :void
    attach_function :bufferColorMatrixUniform, [:uint32, :pointer, :float, :uint8], :void

    attach_function :bufferDrawPackedBuffer, [:uint32, :pointer, :uint32, :uint32, :uint32, :uint32, :uint32], :void
    attach_function :bufferDrawSuperSampleBuffer, [:uint32, :uint32, :uint32, :pointer, :uint32, :uint8, :uint32], :void

    attach_function :bufferDrawGrayscaleBuffer, [:uint32, :int32, :int32, :pointer, :uint32, :uint32, :pointer, :pointer], :void
    attach_function :bufferDrawGrayscaleBufferSupersampled, [:uint32, :int32, :int32, :pointer, :uint32, :uint32, :pointer, :pointer], :void

    attach_function :bufferPushScissorRect, [:uint32, :int32, :int32, :uint32, :uint32], :void
    attach_function :bufferPopScissorRect, [:uint32], :void
    attach_function :bufferPushOpacity, [:uint32, :float], :void
    attach_function :bufferPopOpacity, [:uint32], :void
    attach_function :bufferGetCurrentOpacity, [:uint32], :float
    attach_function :bufferClearOpacity, [:uint32], :void
    attach_function :bufferClearScissorRects, [:uint32], :void

    attach_function :bufferDrawEditorView,     [:uint32, :uint32, :int32, :int32], :void
    attach_function :bufferDrawTextBufferView, [:uint32, :uint32, :int32, :int32], :void

    attach_function :createTextBuffer,       [:uint8], :uint32
    attach_function :destroyTextBuffer,      [:uint32], :void
    attach_function :textBufferGetLength,    [:uint32], :uint32
    attach_function :textBufferGetByteSize,  [:uint32], :uint32
    attach_function :textBufferGetLineCount, [:uint32], :uint32
    attach_function :textBufferGetTabWidth,  [:uint32], :uint8
    attach_function :textBufferSetTabWidth,  [:uint32, :uint8], :void

    attach_function :textBufferReset, [:uint32], :void
    attach_function :textBufferClear, [:uint32], :void
    attach_function :textBufferAppend,   [:uint32, :pointer, :uint32], :void
    attach_function :textBufferLoadFile, [:uint32, :pointer, :uint32], :bool

    attach_function :textBufferSetStyledText, [:uint32, :pointer, :uint32], :void
    attach_function :textBufferGetPlainText, [:uint32, :pointer, :uint32], :uint32

    attach_function :textBufferGetTextRange, [:uint32, :uint32, :uint32, :pointer, :uint32], :uint32
    attach_function :textBufferGetTextRangeByCoords, [:uint32, :uint32, :uint32, :uint32, :uint32, :pointer, :uint32], :uint32

    attach_function :textBufferSetDefaultFg, [:uint32, :pointer], :void
    attach_function :textBufferSetDefaultBg, [:uint32, :pointer], :void
    attach_function :textBufferSetDefaultAttributes, [:uint32, :pointer], :void
    attach_function :textBufferResetDefaults, [:uint32], :void

    attach_function :textBufferRegisterMemBuffer, [:uint32, :pointer, :uint32, :bool], :uint16
    attach_function :textBufferReplaceMemBuffer,  [:uint32, :uint8, :pointer, :uint32, :bool], :bool
    attach_function :textBufferClearMemRegistry,  [:uint32], :void

    attach_function :textBufferSetTextFromMem,  [:uint32, :uint8], :void
    attach_function :textBufferAppendFromMemId, [:uint32, :uint8], :void

    attach_function :textBufferAddHighlight, [:uint32, :uint32, :pointer], :void
    attach_function :textBufferAddHighlightByCharRange, [:uint32, :pointer], :void
    attach_function :textBufferRemoveHighlightsByRef, [:uint32, :uint16], :void

    attach_function :textBufferGetLineHighlightsPtr, [:uint32, :uint32, :pointer], :pointer
    attach_function :textBufferClearLineHighlights, [:uint32, :uint32], :void
    attach_function :textBufferClearAllHighlights, [:uint32], :void
    attach_function :textBufferFreeLineHighlights, [:pointer, :uint32], :void
    attach_function :textBufferGetHighlightCount, [:uint32], :uint32
    attach_function :textBufferSetSyntaxStyle, [:uint32, :uint32], :bool

    attach_function :createTextBufferView, [:uint32], :uint32
    attach_function :destroyTextBufferView, [:uint32], :void

    attach_function :textBufferViewSetSelection, [:uint32, :uint32, :uint32, :pointer, :pointer], :void
    attach_function :textBufferViewResetSelection, [:uint32], :void
    attach_function :textBufferViewGetSelectionInfo, [:uint32], :uint64

    attach_function :textBufferViewSetLocalSelection, [:uint32, :int32, :int32, :int32, :int32, :pointer, :pointer], :bool
    attach_function :textBufferViewResetLocalSelection, [:uint32], :void

    attach_function :textBufferViewUpdateSelection, [:uint32, :uint32, :pointer, :pointer], :void
    attach_function :textBufferViewUpdateLocalSelection, [:uint32, :int32, :int32, :int32, :int32, :pointer, :pointer], :bool

    attach_function :textBufferViewSetWrapWidth, [:uint32, :uint32], :void
    attach_function :textBufferViewSetWrapMode, [:uint32, :uint8], :void
    attach_function :textBufferViewSetFirstLineOffset, [:uint32, :uint32], :void
    attach_function :textBufferViewSetViewportSize, [:uint32, :uint32, :uint32], :void
    attach_function :textBufferViewSetViewport, [:uint32, :uint32, :uint32, :uint32, :uint32], :void

    attach_function :textBufferViewGetVirtualLineCount, [:uint32], :uint32
    attach_function :textBufferViewGetLineInfoDirect, [:uint32, :pointer], :void
    attach_function :textBufferViewGetLogicalLineInfoDirect, [:uint32, :pointer], :void

    attach_function :textBufferViewGetSelectedText, [:uint32, :pointer, :uint32], :uint32
    attach_function :textBufferViewGetPlainText, [:uint32, :pointer, :uint32], :uint32

    attach_function :textBufferViewSetTruncate, [:uint32, :bool], :void
    attach_function :textBufferViewSetTabIndicator, [:uint32, :uint32], :void
    attach_function :textBufferViewSetTabIndicatorColor, [:uint32, :pointer], :void
    attach_function :textBufferViewMeasureForDimensions, [:uint32, :uint32, :uint32, :pointer], :bool

    attach_function :linkAlloc, [:pointer, :uint32], :uint32
    attach_function :linkGetUrl, [:uint32, :pointer, :uint32], :uint32

    attach_function :attributesWithLink, [:uint32, :uint32], :uint32
    attach_function :attributesGetLinkId, [:uint32], :uint32

    attach_function :editBufferInsertText, [:uint32, :pointer, :uint32], :void
    attach_function :editBufferInsertChar, [:uint32, :pointer, :uint32], :void
    attach_function :editBufferNewLine, [:uint32], :void

    attach_function :editBufferDeleteChar, [:uint32], :void
    attach_function :editBufferDeleteCharBackward, [:uint32], :void
    attach_function :editBufferDeleteLine, [:uint32], :void
    attach_function :editBufferDeleteRange, [:uint32, :uint32, :uint32, :uint32, :uint32], :void

    attach_function :editBufferSetText, [:uint32, :pointer, :uint32], :void
    attach_function :editBufferSetTextFromMem, [:uint32, :uint8], :void

    attach_function :editBufferReplaceText, [:uint32, :pointer, :uint32], :void
    attach_function :editBufferReplaceTextFromMem, [:uint32, :uint8], :void

    attach_function :editBufferGetText, [:uint32, :pointer, :uint32], :uint32
    attach_function :editBufferGetTextRange, [:uint32, :uint32, :uint32, :pointer, :uint32], :uint32
    attach_function :editBufferGetTextRangeByCoords, [:uint32, :uint32, :uint32, :uint32, :uint32, :pointer, :uint32], :uint32

    attach_function :editBufferMoveCursorUp,    [:uint32], :void
    attach_function :editBufferMoveCursorDown,  [:uint32], :void
    attach_function :editBufferMoveCursorLeft,  [:uint32], :void
    attach_function :editBufferMoveCursorRight, [:uint32], :void

    attach_function :editBufferGetCursor, [:uint32, :pointer, :pointer], :void
    attach_function :editBufferGetCursorPosition, [:uint32, :pointer], :void
    attach_function :editBufferSetCursor, [:uint32, :uint32, :uint32], :void
    attach_function :editBufferSetCursorByOffset, [:uint32, :uint32], :void
    attach_function :editBufferSetCursorToLineCol, [:uint32, :uint32, :uint32], :void
    attach_function :editBufferGotoLine, [:uint32, :uint32], :void

    attach_function :editBufferGetPrevWordBoundary, [:uint32, :pointer], :void
    attach_function :editBufferGetNextWordBoundary, [:uint32, :pointer], :void

    attach_function :editBufferGetLineStartOffset, [:uint32, :uint32], :uint32
    attach_function :editBufferPositionToOffset, [:uint32, :uint32, :uint32], :uint32
    attach_function :editBufferOffsetToPosition, [:uint32, :uint32, :pointer], :bool
    attach_function :editBufferGetEOL, [:uint32, :pointer], :void

    attach_function :editBufferUndo, [:uint32, :pointer, :uint32], :uint32
    attach_function :editBufferRedo, [:uint32, :pointer, :uint32], :uint32
    attach_function :editBufferCanUndo, [:uint32], :bool
    attach_function :editBufferCanRedo, [:uint32], :bool
    attach_function :editBufferClearHistory, [:uint32], :void
    attach_function :editBufferClear, [:uint32], :void

    attach_function :createEditBuffer, [:uint8, :uint32], :uint32
    attach_function :destroyEditBuffer, [:uint32], :void
    attach_function :editBufferGetTextBuffer, [:uint32], :uint32
    attach_function :editBufferDebugLogRope, [:uint32], :void
    attach_function :editBufferGetId, [:uint32], :uint16

    attach_function :createEditorView, [:uint32, :uint32, :uint32], :uint32
    attach_function :destroyEditorView, [:uint32], :void
    attach_function :editorViewGetTextBufferView, [:uint32], :uint32

    attach_function :editorViewGetViewport, [:uint32, :pointer, :pointer, :pointer, :pointer], :bool
    attach_function :editorViewSetViewport, [:uint32, :uint32, :uint32, :uint32, :uint32, :bool], :void

    attach_function :editorViewSetScrollMargin, [:uint32, :float], :void
    attach_function :editorViewSetViewportSize, [:uint32, :uint32, :uint32], :void

    attach_function :editorViewSetWrapMode, [:uint32, :uint8], :void
    attach_function :editorViewClearViewport, [:uint32], :void

    attach_function :editorViewGetVirtualLineCount, [:uint32], :uint32
    attach_function :editorViewGetTotalVirtualLineCount, [:uint32], :uint32
    attach_function :editorViewGetLineInfoDirect, [:uint32, :pointer], :void
    attach_function :editorViewGetLogicalLineInfoDirect, [:uint32, :pointer], :void

    attach_function :editorViewGetSelection, [:uint32], :uint64
    attach_function :editorViewSetSelection, [:uint32, :uint32, :uint32, :pointer, :pointer], :void
    attach_function :editorViewResetSelection, [:uint32], :void
    attach_function :editorViewUpdateSelection, [:uint32, :uint32, :pointer, :pointer], :void

    attach_function :editorViewSetLocalSelection, [:uint32, :int32, :int32, :int32, :int32, :pointer, :pointer, :bool, :bool], :bool
    attach_function :editorViewResetLocalSelection, [:uint32], :void
    attach_function :editorViewUpdateLocalSelection, [:uint32, :int32, :int32, :int32, :int32, :pointer, :pointer, :bool, :bool], :bool
    attach_function :editorViewGetSelectedTextBytes, [:uint32, :pointer, :uint32], :uint32

    attach_function :editorViewGetCursor, [:uint32, :pointer, :pointer], :void
    attach_function :editorViewGetVisualCursor, [:uint32, :pointer], :void
    attach_function :editorViewSetCursorByOffset, [:uint32, :uint32], :void

    attach_function :editorViewMoveUpVisual, [:uint32], :void
    attach_function :editorViewMoveDownVisual, [:uint32], :void
    attach_function :editorViewGetPrevWordBoundary, [:uint32, :pointer], :void
    attach_function :editorViewGetNextWordBoundary, [:uint32, :pointer], :void

    attach_function :editorViewGetEOL, [:uint32, :pointer], :void
    attach_function :editorViewGetVisualSOL, [:uint32, :pointer], :void
    attach_function :editorViewGetVisualEOL, [:uint32, :pointer], :void
    attach_function :editorViewGetText, [:uint32, :pointer, :uint32], :uint32

    attach_function :editorViewDeleteSelectedText, [:uint32], :void
    attach_function :editorViewSetPlaceholderStyledText, [:uint32, :pointer, :uint32], :void

    attach_function :editorViewSetTabIndicator, [:uint32, :uint32], :void
    attach_function :editorViewSetTabIndicatorColor, [:uint32, :pointer], :void

    attach_function :createOptimizedBuffer, [:uint32, :uint32, :bool, :uint8, :pointer, :uint32], :uint32
    attach_function :drawFrameBuffer,       [:uint32, :int32, :int32, :uint32, :uint32, :uint32, :uint32, :uint32], :void

    attach_function :destroyOptimizedBuffer, [:uint32], :void
    attach_function :destroyFrameBuffer,     [:uint32], :void

    attach_function :createSyntaxStyle, [], :uint32
    attach_function :destroySyntaxStyle, [:uint32], :void
    attach_function :syntaxStyleRegister, [:uint32, :pointer, :uint32, :pointer, :pointer, :uint32], :uint32
    attach_function :syntaxStyleResolveByName, [:uint32, :pointer, :uint32], :uint32
    attach_function :syntaxStyleGetStyleCount, [:uint32], :uint32

    attach_function :encodeUnicode, [:pointer, :uint32, :pointer, :pointer, :uint8], :bool
    attach_function :freeUnicode, [:pointer, :uint32], :void

    attach_function :enableKittyKeyboard,   [:uint32, :uint8], :void
    attach_function :disableKittyKeyboard,  [:uint32], :void

    attach_function :setKittyKeyboardFlags, [:uint32, :uint8], :void
    attach_function :getKittyKeyboardFlags, [:uint32], :uint8

    attach_function :triggerNotification, [:uint32, :pointer, :uint32, :pointer, :uint32], :bool
    attach_function :copyToClipboardOSC52, [:uint32, :uint8, :pointer, :uint32], :bool
    attach_function :clearClipboardOSC52,  [:uint32, :uint8], :bool

    attach_function :setUseThread,       [:uint32, :bool], :void
    attach_function :setRenderOffset,    [:uint32, :uint32], :void
    attach_function :setDebugOverlay,    [:uint32, :bool, :uint8], :void
    attach_function :setClearOnShutdown, [:uint32, :bool], :void
    attach_function :setBackgroundColor, [:uint32, :pointer], :void

    attach_function :setHyperlinksCapability, [:uint32, :bool], :void
    attach_function :clearGlobalLinkPool,     [], :void

    attach_function :checkHit, [:uint32, :uint32, :uint32], :uint32
    attach_function :addToHitGrid, [:uint32, :int32, :int32, :uint32, :uint32, :uint32], :void

    attach_function :clearCurrentHitGrid, [:uint32], :void
    attach_function :hitGridPushScissorRect, [:uint32, :int32, :int32, :uint32, :uint32], :void
    attach_function :hitGridPopScissorRect, [:uint32], :void
    attach_function :hitGridClearScissorRects, [:uint32], :void

    attach_function :addToCurrentHitGridClipped, [:uint32, :int32, :int32, :uint32, :uint32, :uint32], :void
    attach_function :getHitGridDirty, [:uint32], :bool

    attach_function :dumpHitGrid, [:uint32], :void
    attach_function :dumpBuffers, [:uint32, :int64], :void
    attach_function :dumpOutputBuffer, [:uint32, :int64], :void

    attach_function :render, [:uint32, :bool], :uint8
    attach_function :repaintSplitFooter, [:uint32, :uint32, :bool], :uint64
    attach_function :commitSplitFooterSnapshot, [:uint32, :uint32, :uint32, :bool, :bool, :uint32, :bool, :bool, :bool], :uint64

    attach_function :updateStats, [:uint32, :double, :uint32, :double], :void
    attach_function :updateMemoryStats, [:uint32, :uint32, :uint32, :uint32], :void
    attach_function :getRenderStats, [:uint32, :pointer], :void

    attach_function :resetSplitScrollback, [:uint32, :uint32, :uint32], :uint32
    attach_function :syncSplitScrollback, [:uint32, :uint32], :uint32
    attach_function :getSplitOutputOffset, [:uint32, :uint32], :uint32
    attach_function :setPendingSplitFooterTransition, [:uint32, :uint8, :uint32, :uint32, :uint32, :uint32, :uint32], :void
    attach_function :clearPendingSplitFooterTransition, [:uint32], :void

    attach_function :streamSetCallback, [:pointer, :pointer], :void
    attach_function :attachNativeSpanFeed, [:pointer], :int32
    attach_function :destroyNativeSpanFeed, [:pointer], :void
    attach_function :streamClose, [:pointer], :int32
    attach_function :streamWrite, [:pointer, :pointer, :uint32], :int32
    attach_function :streamCommit, [:pointer], :int32
    attach_function :streamReserve, [:pointer, :uint32, :pointer], :int32
    attach_function :streamCommitReserved, [:pointer, :uint32], :int32
    attach_function :streamSetOptions, [:pointer, :pointer], :int32
    attach_function :streamGetStats, [:pointer, :pointer], :int32
    attach_function :streamDrainSpans, [:pointer, :pointer, :uint32], :uint32

    attach_function :createAudioEngine, [:pointer], :uint32
    attach_function :destroyAudioEngine, [:uint32], :void
    attach_function :audioRefreshPlaybackDevices, [:uint32], :int32
    attach_function :audioGetPlaybackDeviceCount, [:uint32], :uint32
    attach_function :audioGetPlaybackDeviceName, [:uint32, :uint32, :pointer, :uint32], :uint32
    attach_function :audioIsPlaybackDeviceDefault, [:uint32, :uint32], :bool
    attach_function :audioSelectPlaybackDevice, [:uint32, :uint32], :int32
    attach_function :audioClearPlaybackDeviceSelection, [:uint32], :void
    attach_function :audioStart, [:uint32, :pointer], :int32
    attach_function :audioStartMixer, [:uint32], :int32
    attach_function :audioStop, [:uint32], :int32
    attach_function :audioLoad, [:uint32, :pointer, :uint32, :pointer], :int32
    attach_function :audioUnload, [:uint32, :uint32], :int32
    attach_function :audioPlay, [:uint32, :uint32, :pointer, :pointer], :int32
    attach_function :audioStopVoice, [:uint32, :uint32], :int32
    attach_function :audioSetVoiceGroup, [:uint32, :uint32, :uint32], :int32
    attach_function :audioCreateGroup, [:uint32, :pointer, :uint32, :pointer], :int32
    attach_function :audioSetGroupVolume, [:uint32, :uint32, :float], :int32
    attach_function :audioSetMasterVolume, [:uint32, :float], :int32
    attach_function :audioMixToBuffer, [:uint32, :pointer, :uint32, :uint8], :int32
    attach_function :audioEnableTap, [:uint32, :bool, :uint32], :int32
    attach_function :audioReadTap, [:uint32, :pointer, :uint32, :uint8, :pointer], :int32
    attach_function :audioGetStats, [:uint32, :pointer], :int32

    attach_function :createNativeSpanFeed, [:pointer], :pointer
    attach_function :createEventSink, [:event_callback], :uint32
    attach_function :destroyEventSink, [:uint32], :void

    attach_function :setLogCallback, [:log_callback], :void
    attach_function :getBuildOptions, [:pointer], :void
    attach_function :getAllocatorStats, [:pointer], :void
    attach_function :getArenaAllocatedBytes, [], :uint64

    callback :log_callback, [:uint8, :pointer, :uint32], :void
    callback :event_callback, [:pointer, :uint32, :pointer, :uint32], :void

    attach_function :processCapabilityResponse, [:uint32, :pointer, :uint32], :void
    attach_function :rendererSetPaletteState, [:uint32, :pointer, :uint32, :pointer, :pointer, :uint32], :void

    attach_function :writeOut, [:uint32, :pointer, :uint32], :void

    attach_function :yogaConfigCreate, [], :pointer
    attach_function :yogaConfigFree, [:pointer], :void

    attach_function :yogaConfigSetUseWebDefaults, [:pointer, :bool], :void
    attach_function :yogaConfigGetUseWebDefaults, [:pointer], :bool
    attach_function :yogaConfigSetPointScaleFactor, [:pointer, :float], :void
    attach_function :yogaConfigGetPointScaleFactor, [:pointer], :float

    attach_function :yogaConfigSetErrata, [:pointer, :uint32], :void
    attach_function :yogaConfigGetErrata, [:pointer], :uint32

    attach_function :yogaConfigSetExperimentalFeatureEnabled, [:pointer, :uint32, :bool], :void
    attach_function :yogaConfigIsExperimentalFeatureEnabled, [:pointer, :uint32], :bool

    attach_function :yogaNodeCreate, [], :pointer
    attach_function :yogaNodeCreateForOpenTUI, [], :pointer
    attach_function :yogaNodeCreateWithConfig, [:pointer], :pointer
    attach_function :yogaNodeFree, [:pointer], :void
    attach_function :yogaNodeFreeRecursive, [:pointer], :void
    attach_function :yogaNodeReset, [:pointer], :void
    attach_function :yogaNodeCopyStyle, [:pointer, :pointer], :void

    attach_function :yogaNodeInsertChild, [:pointer, :pointer, :uint32], :void
    attach_function :yogaNodeRemoveChild, [:pointer, :pointer], :void
    attach_function :yogaNodeRemoveAllChildren, [:pointer], :void
    attach_function :yogaNodeGetChild, [:pointer, :uint32], :pointer
    attach_function :yogaNodeGetChildCount, [:pointer], :uint32
    attach_function :yogaNodeGetParent, [:pointer], :pointer

    attach_function :yogaNodeCalculateLayout, [:pointer, :float, :float, :uint32], :void
    attach_function :yogaNodeGetComputedLayout, [:pointer, :pointer], :void
    attach_function :yogaNodeLayoutGetEdge, [:pointer, :uint32, :uint32], :float

    attach_function :yogaNodeIsDirty, [:pointer], :bool
    attach_function :yogaNodeMarkDirty, [:pointer], :void
    attach_function :yogaNodeGetHasNewLayout, [:pointer], :bool
    attach_function :yogaNodeSetHasNewLayout, [:pointer, :bool], :void
    attach_function :yogaNodeIsReferenceBaseline, [:pointer], :bool
    attach_function :yogaNodeSetIsReferenceBaseline, [:pointer, :bool], :void
    attach_function :yogaNodeGetAlwaysFormsContainingBlock, [:pointer], :bool
    attach_function :yogaNodeSetAlwaysFormsContainingBlock, [:pointer, :bool], :void

    attach_function :yogaNodeStyleSetEnum, [:pointer, :uint32, :uint32], :void
    attach_function :yogaNodeStyleGetEnum, [:pointer, :uint32], :uint32
    attach_function :yogaNodeStyleSetFloat, [:pointer, :uint32, :float], :void
    attach_function :yogaNodeStyleGetFloat, [:pointer, :uint32], :float
    attach_function :yogaNodeStyleSetBorder, [:pointer, :uint32, :float], :void
    attach_function :yogaNodeStyleGetBorder, [:pointer, :uint32], :float
    attach_function :yogaNodeStyleSetValue, [:pointer, :uint32, :uint32, :uint32, :float], :void
    attach_function :yogaNodeStyleGetValue, [:pointer, :uint32, :uint32], :uint64

    attach_function :yogaNodeSetMeasureFunc, [:pointer, :pointer], :void
    attach_function :yogaNodeUnsetMeasureFunc, [:pointer], :void
    attach_function :yogaNodeHasMeasureFunc, [:pointer], :bool
    attach_function :yogaNodeSetDirtiedFunc, [:pointer, :pointer], :void
    attach_function :yogaNodeUnsetDirtiedFunc, [:pointer], :void
    attach_function :yogaStoreMeasureResult, [:float, :float], :void
  end
end
