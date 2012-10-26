class AvatarUploader < ImageUploader
  process :resize_to_fit => [150, 300]

  version :small do
    process :resize_to_fill => [40, 40]
  end
  version :miniature do
    process :resize_to_fill => [32, 32]
  end
  version :thumb do
    process :resize_to_fill => [50, 50]
  end
  version :square do
    process :resize_to_fill => [70, 70]
  end
end
