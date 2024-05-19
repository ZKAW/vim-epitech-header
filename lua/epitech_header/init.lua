-- lua/epitech_header/init.lua

-- Function to insert Epitech header based on file type
local function insert_epitech_header()
    -- Extract project name
    local buf_name = vim.api.nvim_buf_get_name(0)
    local file_name = vim.fn.fnamemodify(buf_name, ':t')
    local file_description = vim.fn.fnamemodify(file_name, ':r')
    local project_name = vim.fn.fnamemodify(vim.loop.cwd(), ':t')
    -- Extract the current file type
    local file_type = vim.bo.filetype

    -- Define the header content based on the file type
    local header
    if file_type == 'c' or file_type == 'cpp' then
        header = string.format([[
/*
** EPITECH PROJECT, %s
** %s
** File description:
** %s
*/
]], os.date("%Y"), project_name, file_description)
    elseif file_type == 'python' then
        header = string.format([[
"""
EPITECH PROJECT, %s
%s
File description:
%s
"""
]], os.date("%Y"), project_name, file_description)
    elseif file_type == 'sh' then
        header = string.format([[
#!/bin/bash
# EPITECH PROJECT, %s
# %s
# File description:
# %s
]], os.date("%Y"), project_name, file_description)
elseif file_type == 'haskell' then
    header = string.format([[
{-
-- EPITECH PROJECT, %s
-- %s
-- File description:
-- %s
-}
]], os.date("%Y"), project_name, file_description)
    else
        -- Default header (similar to C/C++ style)
        header = string.format([[
/*
** EPITECH PROJECT, %s
** %s
** File description:
** %s
*/
]], os.date("%Y"), project_name, file_description)
    end

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
