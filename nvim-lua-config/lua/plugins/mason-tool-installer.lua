return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
        'mason-org/mason.nvim',
        opts = {
            ensure_installed = {
                'prettier', -- Formatter for html, css, js, ts, json, yaml, etc.
            },
        }
    },
}
