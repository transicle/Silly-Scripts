local pacman = require("toolkits.pacman")
local KeybindManager = require("toolkits.binder")

vim.schedule(function()
    local telescope = require("telescope.builtin")

    local function open_file_with_split(direction)
        telescope.find_files({
            prompt_title = "Choose File",
            cwd = vim.fn.expand("~"),
            attach_mappings = function(prompt_bufnr, map)
                local actions = require("telescope.actions")
                local action_state = require("telescope.actions.state")

                map("i", "<CR>", function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)

                    if selection and selection.value then
                        local filepath = selection.value
                        if direction == "left" then
                            vim.cmd("topleft vsplit " .. vim.fn.fnameescape(filepath))
                        elseif direction == "right" then
                            vim.cmd("botright vsplit " .. vim.fn.fnameescape(filepath))
                        elseif direction == "up" then
                            vim.cmd("topleft split " .. vim.fn.fnameescape(filepath))
                        elseif direction == "down" then
                            vim.cmd("botright split " .. vim.fn.fnameescape(filepath))
                        end
                    end
                end)

                return true
            end,
        })
    end

    KeybindManager.map("n", "Control + Left", function()
        open_file_with_split("left")
    end)

    KeybindManager.map("n", "Control + Right", function()
        open_file_with_split("right")
    end)
end)
