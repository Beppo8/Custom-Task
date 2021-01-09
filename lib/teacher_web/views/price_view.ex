defmodule TeacherWeb.PriceView do
  use TeacherWeb, :view

  def format_inserted_at(%{year: year, month: month, day: day, hour: hour, minute: minute, second: second}) do
    "#{month}-#{day}-#{year} #{hour}:#{minute}:#{second}"
  end
end
