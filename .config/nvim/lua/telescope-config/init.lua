local actions = require('telescope.actions')


require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└"},
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
-- extensions = {
--   fzy_native = {
--     override_generic_sorter = false,
--     override_file_sorter = true,
--   }
-- }
 fzf = {
   fuzzy = true,                    -- false will only do exact matching
   override_generic_sorter = true,  -- override the generic sorter
   override_file_sorter = true,     -- override the file sorter
   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                    -- the default case_mode is "smart_case"
 }
}

require("telescope").load_extension "file_browser"
require('telescope').load_extension('fzf')

--require('telescope').load_extension('fzy_native')
