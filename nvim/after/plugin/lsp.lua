local lsp_zero = require('lsp-zero')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- Navigate between completion item
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),

    -- toggle completion
    ['<M-u>'] = cmp_action.toggle_completion(),

    -- navigate between snippet placeholder
    ['<C-a>'] = cmp_action.luasnip_jump_backward(),
    ['<C-d>'] = cmp_action.luasnip_jump_forward(),

    -- Confirm item
    ['<Enter>'] = cmp.mapping.confirm({select = true}),
  }
})

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
  virtual_lines = false,
})

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

lsp_zero.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- Disable virtual text
vim.lsp.handlers["textDocument/hover"] = function() end
vim.lsp.handlers["textDocument/signatureHelp"] = function() end

-- Disable error and warning signs in the sign column
vim.fn.sign_define("LspDiagnosticsSignError", { text = "", numhl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", numhl = "LspDiagnosticsDefaultWarning" })

-- Disable underline for diagnostics
vim.lsp.diagnostic.display = function() end
