return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    callback = function()
        require('nvim-treesitter').install { 'cpp', 'python', 'lua' }
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'svelte', 'python', 'typescript', 'astro' },
            callback = function()
                vim.treesitter.start()                                    -- highlighting
                vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
                vim.wo.foldmethod = 'expr'
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
            end,
        })
    end
}
