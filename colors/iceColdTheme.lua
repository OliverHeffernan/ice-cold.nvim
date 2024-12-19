print("Theme file is being loaded")  -- Debug print at the very start
local lush = require('lush')
print("Lush loaded successfully")    -- Debug print after requiring lush
local hsl = lush.hsl

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.g.colors_name = 'iceColdTheme'


local theme = lush(function()
    return {
		-- programming groups here
        Normal  { fg = hsl(0, 100, 100), bg = hsl(215, 33, 7) },
        Comment { fg = hsl(0, 0, 30), gui = "italic" },
        Keyword { fg = hsl(186, 81, 49), gui = "bold" },
		Type { fg = hsl(186, 81, 49)},
		String { fg = hsl(35, 100, 67) },
		Operator { fg = hsl(350, 100, 66) },
		Statement { fg = hsl(350, 100, 66) },
		Number { fg = hsl(188, 100, 81) },
		Boolean { fg = hsl(188, 100, 81) }, 
		Function { fg = hsl(154, 100, 63) },
		-- editor stuff here
		CursorLine { bg = hsl(215, 34, 13) },
		LineNr { fg = hsl(213, 43, 61) },
		CursorLineNr { fg = hsl(213, 43, 73) },
		StatusLineNC { bg = hsl(215, 35, 13) },
		StatusLine { bg = hsl(215, 35, 26) },
    }
end)
print("Theme created")  -- Debug print after creating theme

local specs = lush.compile(theme)

for group, colors in pairs(spec) do
	vim.api.nvim_set_hl(0, group, colors)
end

print("Theme compiled")  -- Debug print after compiling

return specs
