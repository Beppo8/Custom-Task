defmodule TeacherWeb.CoinController do
  use TeacherWeb, :controller

  alias Teacher.Crypto

  def index(conn, _params) do
    coins = Crypto.list_coins()
    render(conn, "index.html", coins: coins)
  end

end
