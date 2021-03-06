# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV["AWS_BUCKET"]
  config.aws_acl    = "public_read"

  if Rails.env.development?
    config.cache_dir='/home/vagrant/uploads_tmp/tmp/uploads'
    config.root = '/home/vagrant/uploads_tmp/tmp'
  end
  
  config.aws_credentials = {
    access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    secret_access_key: ENV["AWS_SECRET_KEY"],        # required
    region:            ENV["AWS_REGION"]
  }
end


#This is the old version of the carrierwave.rb file which was copy/pasted from the Lesson documentation
# config.fog_provider = 'fog/aws'                        # required
# config.fog_public = false
# config.fog_credentials = {
#   provider:              'AWS',                        # required
#   aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
#   aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
#   region: ENV["AWS_REGION"]
# }
# config.fog_directory  = ENV["AWS_BUCKET"]              # required
#end