local nt = require("neo-tree")
nt.setup({
    filesystem = {
        filtered_items = {
            visible = true,
            toggle_hidden = true,
            hide_gitignored = false,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db"
                --"node_modules"
            },
            never_show = {
                ".gitignore"
            }
        }
    }
})
