local status_ok, session_lens = pcall(require, "session_lens")
if not status_ok then
	return
end

  config = function()
 require("telescope").load_extension("session_lens")
  end

