local setup, null_ls = pcall(required, "null_ls")
if not setup then
    return
end

-- for conciseness
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    sources = {
        formatting.prettier,
        formatting.stylua,
        diagnostics.eslint_d,
    }
})
