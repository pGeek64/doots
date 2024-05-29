local db = require("dashboard")
db.setup {
     theme = 'doom',
    preview = {
    -- command        -- preview command
    -- file_path     -- preview file path
    file_height = 11,   -- preview file height
    file_width = 70,    -- preview file width
  },
  config = {
    header = {
      -- "",
      -- "",
      -- " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      -- " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      -- " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      -- " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      -- " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      -- " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      -- "",
      -- " [ TIP: To exit Neovim, just power off your computer. ] ",
      -- "",
      -- "",
      -- "",
      -- "",
      -- "",
      --
      "",
      "                                                                     ",
      "       ████ ██████           █████      ██                     ",
      "      ███████████             █████                             ",
      "      █████████ ███████████████████ ███   ███████████   ",
      "     █████████  ███    █████████████ █████ ██████████████   ",
      "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
      "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
      " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
      "                                                                       ",
      "                                                                       ",
      " [ TIP: To exit Neovim, just turn off your computer. ] ",
      "                                                                       ",
      "                                                                       ",
    }, --your header
    center = {
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' find files',
        desc_hl = 'String',
        -- key = 'f',
        -- keymap = 'SPC f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' find recent',
        desc_hl = 'String',
        -- key = 'r',
        -- keymap = 'hSPC f',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope oldfiles'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' bookmarks',
        desc_hl = 'String',
        -- key = 'p',
        -- keymap = 'SPC p',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope marks'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' themes',
        desc_hl = 'String',
        -- key = 'th',
        -- keymap = 'SPC t h',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'Telescope themes'
      },
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = ' cheatsheet',
        desc_hl = 'String',
        -- key = 'h',
        -- keymap = 'SPC c h',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = 'NvCheatsheet'
      },
    },
    footer = {		"",
	"",

"",
	"",

    'The void in me is growing 🌀'}  --your footer
    }, -- config
}
