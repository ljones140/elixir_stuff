defmodule Procs do
  def hello(count) do
    receive do
      {:crash, reason} ->
        exit(reason)

      {:quit} ->
        IO.puts("exited")
      {:reset} ->
        hello(0)
      {:add, n} ->
        hello(count + n)

      msg ->
        IO.puts("fooble #{count} #{inspect(msg)}")
        hello(count + 1)
    end
  end
end

# c "procs.ex"
# pid = spawn Procs, :hello, [1]
# send pid, "mary"
# send pid, {:add, 2}
# send pid, {:reset}
# send pid, "mary"
# send pid, {:quit}
# send pid, "mary"
