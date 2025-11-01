local nt = require("neo-tree")

nt.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sync_root_with_cwd = true,
  enable_modified_markers = true,
  use_popups_for_preview = true,
  clipboard = { sync = "global" },

  filesystem = {
    hijack_netrw_behavior = "disabled", -- Neo-tree does not hijack netrw
    follow_current_file = { enabled = true },
    filtered_items = {
      visible = true,
      toggle_hidden = true,
      hide_gitignored = false,
      hide_by_name = { ".DS_Store", "thumbs.db" },
      never_show = { ".gitignore" },
    },
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<cr>"] = "open",
        ["q"] = "close_window",
        ["P"] = "toggle_preview",
        ["l"] = "focus_preview",
        ["S"] = "open_split",
        ["v"] = "open_vsplit",
        ["t"] = "open_tabnew",
        ["w"] = "open_with_window_picker",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["a"] = "add",
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["b"] = "rename_basename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["m"] = "move",
        ["R"] = "refresh",
        ["?"] = "show_help",
      },
    },
  },

  default_component_configs = {
    container = { enable_character_fade = true },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "╰",  -- rounded
      highlight = "NeoTreeIndentMarker",
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
      highlight = "NeoTreeFileIcon",
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "󰁕",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
  buffers = {
    follow_current_file = { enabled = true },
    show_unloaded = true,
    window = {
      position = "left",
      width = 25,
      mappings = {
        ["d"] = "buffer_delete",
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["o"] = "open",
      },
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["gA"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["gU"] = "git_undo_last_commit",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
        ["o"] = "open",
        ["q"] = "close_window",
      },
    },
  },

  source_selector = {
    winbar = false,
    statusline = false,
  },
})
