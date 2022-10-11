# frozen_string_literal: true

class ImageUploader < Shrine
  plugin :validation_helpers

  Attacher.validate do
    validate_size 1024..5 * 1024 * 1024
    validate_extension_inclusion %w[jpg jpeg png]
  end
end
