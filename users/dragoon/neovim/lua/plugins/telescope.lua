return {
  "nvim-telescope/telescope.nvim",
  dependencies = {

    "olacin/telescope-gitmoji.nvim",
    "nvim-telescope/telescope-file-browser.nvim",

    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {

    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      gitmoji = {
        action = function(entry)
          local current_line = vim.fn.line('.')
          local current_col = vim.fn.col('.')
          local emoji_text = entry.value.text
          vim.fn.append(current_line - 1, { emoji_text .. ' ' })
          vim.fn.execute("normal! x")
        end
      },
      file_browser = {
        cwd_to_path = false,
        grouped = false,
        files = true,
        add_dirs = true,
        depth = 1,
        auto_depth = true,
        select_buffer = false,
        hidden = { file_browser = false, folder_browser = false },
        hide_parent_dir = false,
        collapse_dirs = false,
        prompt_path = false,
        quiet = false,
        dir_icon = "",
        dir_icon_hl = "Default",
        display_stat = { date = true, size = true, mode = true },
        hijack_netrw = false,
        use_fd = true,
        git_status = true,
      },
    },
  }
}
