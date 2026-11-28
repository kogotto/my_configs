-- Plugin for formatting
return {
    'stevearc/conform.nvim',
    event = 'BufReadPre',
    opts = {
        formatters_by_ft = {
            html = { 'prettier' },
            css = { 'prettier' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            json = { 'prettier' },
            yaml = { 'prettier' },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'never',
        },
    },
}
