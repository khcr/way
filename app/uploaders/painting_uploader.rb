# encoding: utf-8

class PaintingUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
  include CarrierWave::Processing::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.gallery_id}/#{model.id}"
  end

  process :resize_to_limit => [1200, 1200]
  process :quality => 90
  process :right_orientation

  version :thumb do
    process resize_to_fit: [136, 90]
    process :quality => 90
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def right_orientation
    manipulate! do |img|
      img.auto_orient
      img
    end
  end

end
