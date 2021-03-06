class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
    process resize_to_fill: [50,50]
    storage :file
   # アップロードファイルの保存先ディレクトリは上書き可能
   # 下記はデフォルトの保存先
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
   # アップロード可能な拡張子のリスト
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  include Cloudinary::CarrierWave if Rails.env.production?
  #   process :convert => 'png'
  #   process :tags => ['image']
  #
  #   version :standard do
  #   process :resize_to_fill => [100, 150, :north]
  #   end
  #
  #   version :thumbnail do
  #   process :resize_to_fit => [50, 50]
  #   end
  #
  #   def public_id
  #     return model.id
  #   end

end
