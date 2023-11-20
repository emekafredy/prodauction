# frozen_string_literal: true

module ApplicationHelper
  def formatted_date(date)
    date.strftime('%d %B, %Y')
  end
end
