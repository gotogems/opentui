module OpenTUI
  module Native
    module Buffer
      def self.getCharPtr(buffer)
        Native.bufferGetCharPtr(buffer) or
          raise 'Failed to get char pointer'
      end

      def self.getFgPtr(buffer)
        Native.bufferGetFgPtr(buffer) or
          raise 'Failed to get fg pointer'
      end

      def self.getBgPtr(buffer)
        Native.bufferGetBgPtr(buffer) or
          raise 'Failed to get bg pointer'
      end

      def self.resize(buffer, width, height)
        Native.bufferResize(buffer, width, height)
      end

      def self.clear(buffer, color) # (_, RGBA)
        Native.bufferClear(buffer, color.buffer)
      end

      def self.getId(buffer, max_len = 256)
        out_buffer = FFI::MemoryPointer.new(:uint8, max_len)
        actual_len = Native.bufferGetId(buffer, out_buffer, max_len)
        out_buffer.get_bytes(0, actual_len)
      end

      def self.getRealCharSize(buffer)
        Native.bufferGetRealCharSize(buffer)
      end

      def self.setRespectAlpha(buffer, respect_alpha)
        Native.bufferSetRespectAlpha(buffer, respect_alpha)
      end

      def self.getRespectAlpha(buffer)
        Native.bufferGetRespectAlpha(buffer)
      end

      def self.getAttributesPtr(buffer)
        Native.bufferGetAttributesPtr(buffer) or
          raise 'Failed to get attributes pointer'
      end

      def self.writeResolvedChars(buffer, out_buf, add_line_breaks)
        Native.bufferWriteResolvedChars(buffer, out_buf, out_buf.size, add_line_breaks)
      end

      def self.setCellWithAlphaBlending(buffer, x, y, char, color, bg_color, attributes = 0)
        char_ptr = FFI::MemoryPointer.new(:uint32, 1)
        char_ptr.put_uint32(0, char) # codePointAt(0)?

        bg = bgColor.buffer
        fg = color.buffer

        Native.bufferSetCellWithAlphaBlending(buffer, x, y, char_ptr, fg, bg, attributes || 0)
      end

      def self.setCell(buffer, x, y, char, color, bg_color, attributes = 0)
        char_ptr = FFI::MemoryPointer.new(:uint32, 1)
        char_ptr.put_uint32(0, char) # codePointAt(0)?

        bg = bgColor.buffer
        fg = color.buffer

        Native.bufferSetCell(buffer, x, y, char_ptr, fg, bg, attributes || 0)
      end

      def self.fillRect(buffer, x, y, width, height, color) # RGBA
        bg = rgbaPtr(color)
        Native.bufferFillRect(buffer, x, y, width, height, bg)
      end

      def self.colorMatrix(buffer, matrix_ptr, cell_mask_ptr, cell_mask_count, strength, target)
        Native.bufferColorMatrix(buffer, matrix_ptr, cell_mask_ptr, cell_mask_count, strength, target)
      end

      def self.colorMatrixUniform(buffer, matrix_ptr, strength, target) # TargetChannel
        Native.bufferColorMatrixUniform(buffer, matrix_ptr, strength, target)
      end

      def self.drawSuperSampleBuffer(buffer, x, y, pixelDataPtr, pixelDataLength, format, alignedBytesPerRow) # format: 'bgra8unorm' | 'rgba8unorm'
        formatId = format == 'bgra8unorm' ? 0 : 1
        Native.bufferDrawSuperSampleBuffer(buffer, x, y, pixelDataPtr, pixelDataLength, formatId, alignedBytesPerRow)
      end

      def self.drawPackedBuffer(buffer, dataPtr, dataLen, posX, posY, terminalWidthCells, terminalHeightCells)
        Native.bufferDrawPackedBuffer(buffer, dataPtr, dataLen, posX, posY, terminalWidthCells, terminalHeightCells)
      end

      def self.drawGrayscaleBuffer(buffer, posX, posY, intensitiesPtr, srcWidth, srcHeight, fg, bg)
        Native.bufferDrawGrayscaleBuffer(buffer, posX, posY, intensitiesPtr, srcWidth, srcHeight, fg.buffer, bg.buffer)
      end

      def self.drawGrayscaleBufferSupersampled(buffer, posX, posY, intensitiesPtr, srcWidth, srcHeight, fg, bg)
        Native.bufferDrawGrayscaleBufferSupersampled(buffer, posX, posY, intensitiesPtr, srcWidth, srcHeight, fg.buffer, bg.buffer)
      end

      def self.drawGrid(buffer, borderChars, borderFg, borderBg, columnOffsets, columnCount, rowOffsets, rowCount, options = {})
        border_chars_buf = FFI::MemoryPointer.new(:uint32, 4)
        border_chars_buf.put_array_of_uint32(0, borderChars)

        column_offsets_buf = FFI::MemoryPointer.new(:int32, 4)
        column_offsets_buf.put_array_of_int32(0, columnOffsets)

        row_offsets_buf = FFI::MemoryPointer.new(:int32, 4)
        row_offsets_buf.put_array_of_int32(0, rowOffsets)

        options_buf = GridDrawOptions.new(options)

        Native.bufferDrawGrid(
          buffer,
          border_chars_buf,
          borderFg.buffer,
          borderBg.buffer,
          column_offsets_buf, columnCount,
          row_offsets_buf, rowCount,
          options_buf
        )
      end

      def self.drawChar
      end

      def self.drawBox(buffer, x, y, width, height, borderChars, packedOptions, borderColor, backgroundColor, titleColor, title, bottomTitle)
        border_chars_buf = FFI::MemoryPointer.new(:uint32, 4)
        border_chars_buf.put_array_of_uint32(0, borderChars)

        title_buf = FFI::MemoryPointer.new(:uint8, title.bytesize) # title?
        title_buf.put_bytes(0, title) # titleLen is zero?

        bottom_title_buf = FFI::MemoryPointer.new(:uint8, bottomTitle.bytesize)
        bottom_title_buf.put_bytes(0, bottomTitle)

        Native.bufferDrawBox(
          buffer, x, y, width, height,
          border_chars_buf, packedOptions,
          borderColor.buffer,
          backgroundColor.buffer,
          titleColor.buffer,
          title_buf, title_buf.size,
          bottom_title_buf, bottom_title_buf.size
        )
      end

      def self.drawText(buffer, text, x, y, color, bgColor, attributes = 0)
        text_buf = FFI::MemoryPointer.new(:uint8, text.bytesize)
        text_buf.put_bytes(0, text)

        bg = bgColor.buffer
        fg = color.buffer

        Native.bufferDrawText(buffer, text_buf, text_buf.size, x, y, fg, bg, attributes)
      end

      def self.drawTextBufferView
      end

      def self.drawEditorView
      end

      def self.clearScissorRects(buffer)
        Native.bufferClearScissorRects(buffer)
      end

      def self.pushScissorRect(buffer, x, y, width, height)
        Native.bufferPushScissorRect(buffer, x, y, width, height)
      end

      def self.popScissorRect(buffer)
        Native.bufferPopScissorRect(buffer)
      end

      def self.getCurrentOpacity(buffer)
        Native.bufferGetCurrentOpacity(buffer)
      end

      def self.clearOpacity(buffer)
        Native.bufferClearOpacity(buffer)
      end

      def self.pushOpacity(buffer, opacity)
        Native.bufferPushOpacity(buffer, opacity)
      end

      def self.popOpacity(buffer)
        Native.bufferPopOpacity(buffer)
      end
    end
  end
end
