vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Info" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Line Diagnostic" })
vim.diagnostic.config({
    virtual_text = true,
    signs = true,      
    update_in_insert = false, 
    underline = true,    
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = signs.Error,
            [vim.diagnostic.severity.WARN]  = signs.Warn,
            [vim.diagnostic.severity.HINT]  = signs.Hint,
            [vim.diagnostic.severity.INFO]  = signs.Info,
        },
    },
    virtual_text = { prefix = "●" },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = { border = "rounded" },
})



vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        }
    }
})
