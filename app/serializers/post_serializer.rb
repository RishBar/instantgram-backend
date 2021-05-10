class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :caption, :images
  def images
    if object.images.attached?
      {
        url: rails_blob_url(object.images[0])
      }
    end
  end
end
