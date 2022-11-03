local status_ok, spectre = pcall(require,"spectre")
if not status_ok then
  -- print "spectre.nvim could not be found"
  return
else
  spectre.setup()
  print "spectre is working"
end

