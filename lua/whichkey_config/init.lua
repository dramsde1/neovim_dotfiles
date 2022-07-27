local wk = require("which-key")
local mappings = {
    ff = { ":Telescope find_files<cr>", "Telescope Find Files" },
    fg = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
    of = { ":Telescope oldfiles<cr>", "Telescope Live Grep" },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
