require("presence"):setup({
    neovim_image_text   = "like notepad but with colors ๐",
    main_image          = "file",
    enable_line_number  = true,
    blacklist           = {},
    buttons             = false,
    -- Rich Presence text options
    editing_text        = "๐ฉโ๐ป Editing %s ๐",
    file_explorer_text  = "๐ Browsing %s",
    git_commit_text     = "โ  Committing changes",
    plugin_manager_text = "๐งน Managing plugins",
    reading_text        = "๐ค Reading %s",
    workspace_text      = "Working on %s",
    line_number_text    = "Line %s out of %s",
})
