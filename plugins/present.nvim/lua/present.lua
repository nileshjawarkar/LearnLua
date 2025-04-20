local M = {}

--- Initialise the plugin
M.setup = function()
end

--- @class present.Slides
--- @field content string[]: The slides from the file

--- This API creates slides content
--- @param lines string[]: Line from the buffer
--- @return present.Slides
local parse_slides = function(lines)
    local Slides = {
        content = {}
    }

    local cur_content = nil
    local seperator = "^#"
    for _, line in ipairs(lines) do
        if line:find(seperator) == 1 then
            if cur_content ~= nil then
                table.insert(Slides.content, cur_content)
            end
            cur_content = {}
        end

        if cur_content ~= nil then
            table.insert(cur_content, line)
        end
    end

    table.insert(Slides.content, cur_content)
    return Slides
end

local function create_floating_window(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- Calculate the position to center the window
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    -- Create a buffer
    local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
    -- Define window configuration
    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- No borders or extra UI elements
        border = "rounded",
    }

    -- Create the floating window
    local win = vim.api.nvim_open_win(buf, true, win_config)
    return { buf = buf, win = win }
end

M.start_presentation = function(opt)
    opt = opt or {}
    opt.bufnr = opt.bufnr or 0
    local lines = vim.api.nvim_buf_get_lines(opt.bufnr, 0, -1, false)
    local slides = parse_slides(lines)

    if type(slides.content) ~= "table" or #slides.content < 1 then
        return
    end

    local flt_win = create_floating_window()

    local cur_slide = 1
    vim.keymap.set("n", "<leader>kn", function()
        cur_slide = math.min(cur_slide + 1, #slides.content)
        vim.api.nvim_buf_set_lines(flt_win.buf, 0, -1, false, slides.content[cur_slide])
    end, { buffer = flt_win.buf })

    vim.keymap.set("n", "<leader>kp", function()
        cur_slide = math.max(cur_slide - 1, 1)
        vim.api.nvim_buf_set_lines(flt_win.buf, 0, -1, false, slides.content[cur_slide])
    end, { buffer = flt_win.buf })

    vim.keymap.set("n", "<leader>kq", function()
        vim.api.nvim_win_close(flt_win.win, true)
    end, { buffer = flt_win.buf })

    vim.api.nvim_buf_set_lines(flt_win.buf, 0, -1, false, slides.content[cur_slide])
end

return M
