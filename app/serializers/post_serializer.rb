class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :caption, :images
  def images
    object.images.map do |image| 
      rails_blob_url(image)
    end
  end
end

