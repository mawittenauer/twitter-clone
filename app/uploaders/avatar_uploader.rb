class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  process :resize_to_fill => [200, 200]
  
  def default_url(*args)
    "/images/default_profile_pic.jpg"
  end
end
