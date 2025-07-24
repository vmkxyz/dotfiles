require("full-border"):setup()
require("no-status"):setup()

-- Sync yank clipboard across instances
require("session"):setup {
	sync_yanked = true,
}

-- Inline file info
function Linemode:custom()
  local year = os.date("%Y")
  local time = (self._file.cha.mtime or 0) // 1

  if time > 0 and os.date("%Y", time) == year then
    time = os.date("%b %d %H:%M", time)
  else
    time = time and os.date("%b %d  %Y", time) or ""
  end

  local size = self._file:size()
  return ui.Line(string.format(" %s %s ", size and ya.readable_size(size):gsub(" ", "") or "-", time))
end

-- Show username and hostname in header
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
