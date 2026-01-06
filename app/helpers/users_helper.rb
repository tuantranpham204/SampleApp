module UsersHelper
  def gravatar_for(user, options = { size: 80 })
    size = options[:size]
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def style_li(bootstrap_params)
    class_params = ""
    bootstrap_params.each do | str |
      class_params += str + " "
    end
    class_params
  end
end
