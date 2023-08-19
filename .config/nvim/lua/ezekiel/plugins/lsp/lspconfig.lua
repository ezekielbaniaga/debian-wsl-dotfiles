local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

-- import typescript-language-server LSP plugin safely
--local typescript_setup, typescript = pcall(require, "typescript")
--if not typescript_setup then
    --return
--end

local keymap = vim.keymap

-- enable keybinds for available lsp server.
-- for each lsp server, these are attached keybinds
-- you can further customize keybindings per server
-- by checking client.name
local on_attach = function(client, bufnr)

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds

    keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
    keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "}", "<cmd>Lspsaga hover_doc<CR>", opts)
    keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

    -- typescript specific keymaps (e.g. rename file and update imports)
--    if client.name == "tsserver" then
--        keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
--        keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
--        keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
--    end

end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

--typescript.setup({
    --server = {
     --   capabilities = capabilities,
      --  on_attach = on_attach,
    --}
--})

local servers = {
	"clangd",
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"lemminx",
	"lua_ls",
	"marksman",
	"quick_lint_js",
	"rust_analyzer",
	"sqlls",
	"tsserver"
}

for _,lsp in ipairs(servers) do

	if lsp == "lua_ls" then

		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						global = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config").."/lua"] = true,
						},
					},
				},
			}
		})

	else

		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = on_attach
		})

	end

end
