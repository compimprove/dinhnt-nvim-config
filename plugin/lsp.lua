require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'rust_analyzer',
    'eslint',
    'html',
    'cssmodules_ls',
    'angularls',
    'jsonls',
    'tsserver',
    'lua_ls',
  }
})


local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false }
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts) 

end)

-- (Optional) Configure lua language server for neovim

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})


lsp.setup()
