return function(capabilities)
	local luacheck = require("efmls-configs.linters.luacheck") -- lua linter
	local stylua = require("efmls-configs.formatters.stylua") -- lua formatter
	local flake8 = require("efmls-configs.linters.flake8") -- python linter
	local black = require("efmls-configs.formatters.black") -- python formatter
	local shellcheck = require("efmls-configs.linters.shellcheck") -- bash linter
	local shfmt = require("efmls-configs.formatters.shfmt") -- bash formatter
	local cpplint = require("efmls-configs.linters.cpplint") -- c/cpp linter
	local clangformat = require("efmls-configs.formatters.clang_format") -- c/cpp formatter

	vim.lsp.config("efm", {
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"lua",
			"python",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
				lua = { luacheck, stylua },
				python = { flake8, black },
			},
		},
	})
end
