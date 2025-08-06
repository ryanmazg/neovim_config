return {
	"neovim/nvim-lspconfig",
	config = function()
		-- Python
		vim.lsp.config["pyright"] = {
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = {
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				"pyrightconfig.json",
				".git",
			},
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "openFilesOnly",
						useLibraryCodeForTypes = true,
					},
				},
			},
		}

		-- Lua
		vim.lsp.config("lua_ls", {
			on_init = function(client)
				if client.workspace_folders then
					local path = client.workspace_folders[1].name
					if
						path ~= vim.fn.stdpath("config")
						and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
					then
						return
					end
				end

				client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most
						-- likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Tell the language server how to find Lua modules same way as Neovim
						-- (see `:h lua-module-load`)
						path = {
							"lua/?.lua",
							"lua/?/init.lua",
						},
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							-- Depending on the usage, you might want to add additional paths
							-- here.
							-- '${3rd}/luv/library'
							-- '${3rd}/busted/library'
						},
						-- Or pull in all of 'runtimepath'.
						-- NOTE: this is a lot slower and will cause issues when working on
						-- your own configuration.
						-- See https://github.com/neovim/nvim-lspconfig/issues/3189
						-- library = {
						--   vim.api.nvim_get_runtime_file('', true),
						-- }
					},
				})
			end,
			settings = {
				Lua = {},
			},
		})

		-- HTML
		vim.lsp.config["html"] = {
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "templ" },
			init_options = {
				configurationSection = { "html", "css", "javascript" },
				embeddedLanguages = {
					css = true,
					javascript = true,
				},
				provideFormatter = true,
			},
			root_markers = { "package.json", ".git" },
			settings = {},
		}

		-- CSS
		vim.lsp.config["cssls"] = {
			cmd = { "vscode-css-language-server", "--stdio" },
			filetypes = { "css", "scss", "less" },
			init_options = {
				provideFormatter = true,
			},
			root_markers = { "package.json", ".git" },
			settings = {
				css = {
					validate = true,
				},
				less = {
					validate = true,
				},
				scss = {
					validate = true,
				},
			},
		}

		-- JavaScript
		vim.lsp.config["ts_ls"] = {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
			init_options = {
				hostInfo = "neovim",
			},
			root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		}
	end,
	vim.lsp.enable("pyright"),
	vim.lsp.enable("lua_ls"),
	vim.lsp.enable("html"),
	vim.lsp.enable("cssls"),
	vim.lsp.enable("ts_ls"),
}
