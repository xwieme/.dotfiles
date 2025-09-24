return {
    cmd = {
        "ruff server",
    },
    filetypes = {
        "py",
    },
    root_markers = {
        ".git",
        "environment.yml",
        "requirements.txt",
        "pyproject.toml",
        "pixi.toml"
    },
    single_file_support = true,
    log_level = vim.lsp.protocol.MessageType.Warning,
}
