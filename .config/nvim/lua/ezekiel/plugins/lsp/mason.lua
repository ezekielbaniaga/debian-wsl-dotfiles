local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

-- disabled null-ls since we don't want to auto format on save
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    return
end

mason.setup({
	PATH = "prepend",
})

-- available lsp here: https://github.com/williamboman/mason-lspconfig.nvim#default-configuration
mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "cssls",
        "html",
        "jsonls",
        "quick_lint_js",
		"tsserver",
		"eslint",
        "lua_ls",
        "marksman",
        "rust_analyzer",
        "sqlls",
        "lemminx",
		"tsserver",
		"zls"
    }
})


-- disabled null-ls since we don't want to auto format on save
mason_null_ls.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
    }
})

