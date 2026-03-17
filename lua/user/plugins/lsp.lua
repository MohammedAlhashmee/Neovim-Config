return {
    "neovim/nvim-lspconfig",
    config = function()
        servers = { "clangd", "ts_ls", "lua_ls", "pyright", "vimls" }
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        for _, server in ipairs(servers) do
            vim.lsp.config(server, {
                capabilities = capabilities,
            })
        end
        vim.lsp.enable(servers)
    end,
    dependencies = {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    }
}
