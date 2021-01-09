defmodule TeacherWeb.PriceController do
  use TeacherWeb, :controller

  alias Teacher.Crypto

  def index(conn, %{"coin_id" => coin_id}) do
    coin = Crypto.get_coin!(coin_id)
    render(conn, "index.html", coin: coin, prices: coin.prices)
  end

end
