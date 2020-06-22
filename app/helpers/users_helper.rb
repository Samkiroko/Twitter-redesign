module UsersHelper
  def avatar_for(user, options = { size: 100 })
    first_name = user.full_name.split(' ')[0]
    last_name = user.full_name.split(' ')[1]
    size = options[:size]
    a_url = "https://eu.ui-avatars.com/api/?name=#{first_name}+#{last_name}&size=#{size}&background=0D8ABC&color=fff"
    image_tag(a_url, alt: user.full_name, class: 'avatar')
  end
end
