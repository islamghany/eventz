module EventsHelper
  def price(event)
    if event.free?
      content_tag(:strong, "Free!")
    else
      number_to_currency(event.price)
    end
  end

  def event_time(event)
    event.starts_at.strftime("%B %d, %Y %H:%M")
  end
end
