function Linemode:size_and_mtime()
  local time = math.floor(self._file.cha.mtime or 0)
  local display_time

  if time == 0 then
    display_time = ""
  elseif os.date("%Y", display_time) == os.date("%Y") then
    display_time = os.date("%b %d %H:%M", display_time)
  else
    display_time = os.date("%b %d  %Y", display_time)
  end

  local size = self._file:size()
  return string.format("%s %s", size and ya.readable_size(size) or "-", display_time)
end
