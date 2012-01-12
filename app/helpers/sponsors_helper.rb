module SponsorsHelper
  def display_logo(sponsor)
    if sponsor.logo_display
      content_tag(:p, link_to(image_tag("#{sponsor.logo.url}"), sponsor.url, :target => "_blank"))
    else
      content_tag(:p, link_to(image_tag("#{sponsor.page_logo.url}"), sponsor.url, :target => "_blank"), :class => 'center') unless sponsor.page_logo_file_name.nil?
    end
  end
end
