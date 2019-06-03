module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Sign Up", new_user_registration_path, class: style) + tag(:hr) +
      " ".html_safe + 
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end 

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to 
      #{ link_to'sign up', new_user_registration_path} and join our community."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end 

  def copyright_generator
    BurnItViewTool::Renderer.copyright 'BurnIt Challenge', 'All rights reserved.'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: my_story_path,
        title: 'My Story'
      },
      {
        url: get_motivated_path,
        title: '#Burnitchallenge'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Workouts'
      },
      
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}><hr>"
    end

    nav_links.html_safe
  end

  def active? path
      "active" if current_page? path
  end   

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert 
      alert_generator alert
    end 
  end 

  def alert_generator msg
      js add_gritter(msg, title: "Leon Ward's BurnIt Challenge", sticky: false, time: 3500)
  end 

  def truncate(text, length = 30, truncate_string = "...")
  if text
    l = length - truncate_string.chars.to_a.length
    chars = text.chars
    (chars.to_a.length > length ? chars.to_a[0...l].to_s + truncate_string : text).to_s
  end
end

end
