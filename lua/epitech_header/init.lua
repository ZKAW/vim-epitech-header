local header_templates = {
    c = [[
/*
** EPITECH PROJECT, %s
** %s
** File description:
** %s
*/
]],
    cpp = [[
/*
** EPITECH PROJECT, %s
** %s
** File description:
** %s
*/
]],
    python = [[
"""
EPITECH PROJECT, %s
%s
File description:
%s
"""
]],
    sh = [[
#!/bin/bash
# EPITECH PROJECT, %s
# %s
# File description:
# %s
]],
    haskell = [[
{-
-- EPITECH PROJECT, %s
-- %s
-- File description:
-- %s
-}
]],
}

local function insert_epitech_header()
    -- Extract project name
    local buf_name = vim.api.nvim_buf_get_name(0)
    local file_name = vim.fn.fnamemodify(buf_name, ':t')
    local file_description = vim.fn.fnamemodify(file_name, ':r')
    local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ':t')

    -- Extract the current file type
    local file_type = vim.bo.filetype

    -- Look up the template for the current file type
    local template = header_templates[file_type] or header_templates['c']

    -- Generate the header using the template
    local header = string.format(template, os.date("%Y"), project_name, file_description)

    -- Insert the header at the top of the current buffer
    vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(header, '\n'))
end

-- Setup function
local function setup(config)
    config = config or {}
    local keymap = config.keymap or '<leader>eh'

    -- Register the function as a command
    vim.api.nvim_create_user_command('EpitechHeader', function()
        insert_epitech_header()
    end, {})

    -- Create a keymap for the command
    vim.api.nvim_set_keymap('n', keymap, ':EpitechHeader<CR>', { noremap = true, silent = true })
end

-- Return the module with the function
return {
    insert_epitech_header = insert_epitech_header,
    setup = setup
}
