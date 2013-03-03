# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  process :resize_to_limit => [300, 300]
  process :quality => 90

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    Time.new.to_time.to_i.to_s if original_filename
  end
end
