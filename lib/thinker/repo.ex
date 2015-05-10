defmodule Thinker.Repo do
	def start_link do
		conn = Exrethinkdb.connect
		Agent.start_link(fn -> conn end, name: __MODULE__)
		{:ok, self}
	end

	def run(query) do
		Agent.get(__MODULE__, fn conn -> 
			query |> 
			Exrethinkdb.run conn
		end)
	end
end