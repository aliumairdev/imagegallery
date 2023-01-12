# frozen_string_literal: true

module AttachmentsHelper
  def check_for_user_like(attachment)
    if user_signed_in?
      return true if attachment.already_liked(attachment, current_user)

      return false
    end
    false
  end

  def show_gallery_image(user)
    user.attachments.last.image.large_thumb.url
  end
end
