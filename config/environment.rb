# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
class Paperclip::Attachment
  default_options.merge!(
      storage: :s3,
      url: ":s3_domain_url",
      path: "/:class/:attachment/:id_partition/:style/:filename"
  )
end