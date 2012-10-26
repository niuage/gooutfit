class OutfitPhotoUploader < ImageUploader
  process :resize_to_fit => [600, 600]

  version :iphone do
    process :resize_to_fit => [320, 480]
  end

end
