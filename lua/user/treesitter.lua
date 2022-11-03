local status_ok, config = pcall(require,"nvim-treesitter.configs")
if not status_ok then
  print "Treesitter could not be found"
  return
end


config.setup{
  ensure_installed = {"python","lua","cpp","c"} ,
  sync_install = false,
  ignore_install = {""},
  highlight =  {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = {"yaml"} },


  --playground config
   playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}
