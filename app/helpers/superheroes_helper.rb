module SuperheroesHelper

  def display_present_attribute(name, value)
    if value.present?
      content_tag "h3" do
        name + " : " + value
      end
    end
  end
end
