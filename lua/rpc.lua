require("presence"):setup({
    neovim_image_text   = "like notepad but with colors 🌈",
    main_image          = "file",
    enable_line_number  = true,
    blacklist           = {},
    buttons             = false,
    -- Rich Presence text options
    editing_text        = "👩‍💻 Editing %s",
    file_explorer_text  = "📁 Browsing %s",
    git_commit_text     = "✍  Committing changes",
    plugin_manager_text = "🧹 Managing plugins",
    reading_text        = "🤓 Reading %s",
    workspace_text      = "Working on %s",
    line_number_text    = "Line %s out of %s",
})
