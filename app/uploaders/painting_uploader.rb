# encoding: utf-8

class PaintingUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.gallery_id}/#{model.id}"
  end

  process :resize_to_fit => [900, 900]

  version :thumb do
    process resize_to_fit: [150, 150]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
