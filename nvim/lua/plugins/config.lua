local M = {}

function M.alpha()
	return function()
		local alpha_loaded, alpha = pcall(require, "alpha")

		if not alpha_loaded then
			return
		end

		local api = vim.api
		local cmd = vim.cmd

		local function build_option(sc, text, key_bindings)
			local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")
			local opts = {
				position = "center",
				text = text,
				shortcut = sc,
				cursor = 5,
				width = 24,
				align_shortcut = "right",
				hl_shortcut = "Special",
				hl = "DiagnosticFloatingInfo",
			}

			if key_bindings then
				opts.keymap = { "n", sc_, key_bindings, { noremap = true, silent = true } }
			end

			return {
				type = "button",
				val = text,
				on_press = function()
					local key = api.nvim_replace_termcodes(sc_, true, false, true)
					api.nvim_feedkeys(key, "normal", false)
				end,
				opts = opts,
			}
		end

		local options = {
			type = "group",
			val = {
				build_option("p", "  Find File", "<cmd>FzfLua files<CR>"),
				build_option("f", "  Find Word", "<cmd>FzfLua live_grep<CR>"),
				build_option("o", "  Project structure", "<cmd>NvimTreeToggle<CR>"),
				build_option("n", "  New File", "<cmd>ene!<CR>"),
				build_option("s", "  Settings", "<cmd>e $HOME/.config/nvim/lua/default_config.lua<CR>"),
				build_option("q", "  Quit", "<cmd>qa<CR>"),
			},
			opts = {
				position = "center",
				spacing = 2,
			},
		}

		local screen_height = vim.api.nvim_list_uis()[1].height
		local options_height = 15
		local section = {
			options = options,
		}

		local opts = {
			layout = {
				{
					type = "padding",
					val = math.floor((screen_height - options_height) * 0.5),
				},
				section.options,
			},
		}

		--@usage[[ apply config to alpha ]]
		alpha.setup(opts)

		--@usage[[ disable folding on alpha buffer ]]
		cmd("autocmd FileType alpha setlocal nofoldenable")
	end
end

function M.autopairs()
	return function()
		local autopairs_loaded, autopairs = pcall(require, "nvim-autopairs")
		local cmp_loaded, cmp = pcall(require, "cmp")

		if not (autopairs_loaded or cmp_loaded) then
			return
		end

		autopairs.setup({
			disable_filetype = { "TelescopePrompt" },
			--@usage[[ check bracket in same line ]]
			enable_check_bracket_line = false,
			--@usage[[ check treesitter ]]
			check_ts = true,
			enable_moveright = true,
			--@usage[[ disable when recording or executing a macro ]]
			disable_in_macro = false,
			--@usage[[ add bracket pairs after quote ]]
			enable_afterquote = true,
			--@usage[[ map the <BS> key ]]
			map_bs = true,
			--@usage[[ map <c-w> to delete a pair if possible ]]
			map_c_w = false,
			--@usage[[ disable when insert after visual block mode ]]
			disable_in_visualblock = false,
			--@usage[[ change default fast_wrap ]]
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from pattern match
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})

		--@usage[[ intergate with cmp ]]
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
	end
end

function M.bufferline()
	return function()
		local bufferline_loaded, bufferline = pcall(require, "bufferline")

		if not bufferline_loaded then
			return
		end

		local fn = vim.fn

		bufferline.setup({
			options = {
				numbers = "none",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				middle_mouse_command = nil,
				indicator = {
					icon = "▎",
					style = "icon",
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				--@usage[[ can be used to change the buffer's label in the bufferline ]]
				name_formatter = function(buf)
					if buf.name:match("%.md") then
						return fn.fnamemodify(buf.name)
					end
				end,
				max_name_length = 14,
				max_prefix_length = 10,
				tab_size = 16,
				diagnostics = false,
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				--@usage[[ whether or not custom sorted buffers should persist ]]
				persist_buffer_sort = true,
				--@usage[[ 'slant' | 'thick' | 'thin' | { 'any', 'any' } ]]
				separator_style = "thin",
				enforce_regular_tabs = false,
				always_show_bufferline = false,
				sort_by = "id",
			},
		})
	end
end

function M.cmp()
	return function()
		local cmp_loaded, cmp = pcall(require, "cmp")
		local luasnip_loaded, luasnip = pcall(require, "luasnip")

		if not (cmp_loaded or luasnip_loaded) then
			return
		end

		local kind_icons = {
			Array = "",
			Boolean = "◩",
			Class = "",
			Color = "",
			Constant = "",
			Constructor = "",
			Enum = "練",
			EnumMember = "",
			Event = "",
			Field = "",
			File = "",
			Folder = "",
			Function = "",
			Interface = "練",
			Key = "",
			Keyword = "",
			Method = "",
			Module = "",
			Null = "",
			Namespace = "",
			Number = "",
			Object = "",
			Operator = "",
			Property = "",
			Package = "",
			Reference = "",
			Snippet = "",
			String = "",
			Struct = "",
			Text = "",
			TypeParameter = "",
			Unit = "塞",
			Value = "",
			Variable = "",
		}

		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))

			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None",
					scrollbar = "║",
				},
				completion = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					winhighlight = "Normal:Normal,FloatBorder:PmenuBorder,CursorLine:Visual,Search:None",
					scrollbar = nil,
				},
			},
			mapping = {
				["<Down>"] = cmp.mapping.scroll_docs(-4),
				["<Up>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					item.kind = kind_icons[item.kind]
					item.menu = ({
						nvim_lsp = "(LSP)",
						luasnip = "(Snippet)",
						path = "(Path)",
						buffer = "(Buffer)",
					})[entry.source.name]
					item.dup = ({
						nvim_lsp = 0,
						luasnip = 1,
						buffer = 1,
						path = 1,
					})[entry.source.name] or 0

					return item
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
			},
		})
	end
end

function M.comment()
	return function()
		local comment_loaded, comment = pcall(require, "Comment")

		if not comment_loaded then
			return
		end

		comment.setup({
			padding = true,
			sticky = true,
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			pre_hook = function(ctx)
				local U = require("Comment.utils")
				local location = nil

				if ctx.ctype == U.ctype.block then
					location = require("ts_context_commentstring.utils").get_cursor_location()
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = require("ts_context_commentstring.utils").get_visual_start_location()
				end

				return require("ts_context_commentstring.internal").calculate_commentstring({
					key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
					location = location,
				})
			end,
		})
	end
end

function M.filetype()
	return function()
		local glob = vim.g

		glob.did_load_filetypes = 1
	end
end

function M.flutter()
	return function()
		local flutter_loaded, flutter = pcall(require, "flutter-tools")

		if not flutter_loaded then
			return
		end

		flutter.setup({
			ui = {
				border = "rounded",
				notification_style = "native",
			},
			decorations = {
				statusline = {
					app_version = false,
					device = false,
				},
			},
			lsp = {
				color = {
					enabled = false,
					background = false,
					foreground = false,
					virtual_text = false,
					virtual_text_str = "",
				},
				settings = {
					showTodos = false,
					completeFunctionCalls = true,
					renameFilesWithClasses = "prompt",
					enableSnippets = true,
				},
			},
		})
	end
end

function M.gitsigns()
	return function()
		local gitsigns_loaded, gitsigns = pcall(require, "gitsigns")

		if not gitsigns_loaded then
			return
		end

		gitsigns.setup({
			numhl = false,
			linehl = false,
			word_diff = false,
			signcolumn = true,
			signs = {
				add = { hl = "DiffAdd", text = "" },
				change = { hl = "DiffChange", text = "" },
				delete = { hl = "DiffDelete", text = "" },
				topdelete = { hl = "DiffDelete", text = "" },
				changedelete = { hl = "DiffChange", text = "" },
			},
			status_formatter = nil,
			sign_priority = 6,
			debug_mode = false,
			current_line_blame = false,
			update_debounce = 100,
		})
	end
end

function M.harpoon()
	return function()
		local mark_loaded, mark = pcall(require, "harpoon.mark")
		local ui_loaded, ui = pcall(require, "harpoon.ui")

		if not (mark_loaded or ui_loaded) then
			return
		end

		local map = function(...)
			vim.keymap.set("n", ...)
		end

		--@usage[[ add file ]]
		map("<leader>fa", mark.add_file)
		--@usage[[ toggle quick menu ]]
		map("<leader>fl", ui.toggle_quick_menu)
		--@usage[[ go next ]]
		map("<leader>fn", ui.nav_next)
		--@usage[[ go previous ]]
		map("<leader>fp", ui.nav_prev)
	end
end

function M.icons()
	return function()
		local devicons_loaded, icons = pcall(require, "nvim-web-devicons")
		local colors_loaded, highlights = pcall(require, "colors.highlights")

		if not (devicons_loaded or colors_loaded) then
			return
		end

		local colors = highlights.colors

		icons.setup({
			override = {
				c = {
					icon = "",
					color = colors.blue,
					name = "c",
				},
				cc = {
					icon = "",
					color = colors.blue,
					name = "cc",
				},
				cpp = {
					icon = "",
					color = colors.blue,
					name = "cpp",
				},
				css = {
					icon = "",
					color = colors.blue,
					name = "css",
				},
				deb = {
					icon = "",
					color = colors.red,
					name = "deb",
				},
				Dockerfile = {
					icon = "",
					color = colors.blue,
					name = "Dockerfile",
				},
				html = {
					icon = "",
					color = colors.orange,
					name = "html",
				},
				java = {
					icon = "",
					color = colors.red,
					name = "java",
				},
				jpeg = {
					icon = "",
					color = colors.magenta,
					name = "jpeg",
				},
				jpg = {
					icon = "",
					color = colors.magenta,
					name = "jpg",
				},
				js = {
					icon = "",
					color = colors.orange,
					name = "js",
				},
				kt = {
					icon = "󱈙",
					color = colors.orange,
					name = "kt",
				},
				lock = {
					icon = "",
					color = colors.red,
					name = "lock",
				},
				lua = {
					icon = "",
					color = colors.blue,
					name = "lua",
				},
				mp3 = {
					icon = "",
					color = colors.blue,
					name = "mp3",
				},
				mp4 = {
					icon = "",
					color = colors.blue,
					name = "mp4",
				},
				out = {
					icon = "",
					color = colors.blue,
					name = "out",
				},
				png = {
					icon = "",
					color = colors.magenta,
					name = "png",
				},
				py = {
					icon = "",
					color = colors.orange,
					name = "py",
				},
				toml = {
					icon = "",
					color = colors.blue,
					name = "toml",
				},
				ts = {
					icon = "",
					color = colors.blue,
					name = "ts",
				},
				rb = {
					icon = "",
					color = colors.red,
					name = "rb",
				},
				rpm = {
					icon = "",
					color = colors.orange,
					name = "rpm",
				},
				vue = {
					icon = "﵂",
					color = colors.green,
					name = "vue",
				},
				xz = {
					icon = "",
					color = colors.orange,
					name = "xz",
				},
				zip = {
					icon = "",
					color = colors.orange,
					name = "zip",
				},
			},
		})
	end
end

function M.lsp()
	return function()
		local lsp = vim.lsp

		local customize = function()
			local handlers = lsp.handlers
			local fn = vim.fn

			--@usage[[ diagnostics ]]
			handlers["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
				signs = true,
				virtual_text = false,
				underline = true,
				severity_sort = false,
			})

			--@usage[[ symbols in the sign column (gutter) ]]
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				fn.sign_define(hl, { text = icon, texthl = hl })
			end

			local border = {
				{ "╭", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╮", "FloatBorder" },
				{ "│", "FloatBorder" },
				{ "╯", "FloatBorder" },
				{ "─", "FloatBorder" },
				{ "╰", "FloatBorder" },
				{ "│", "FloatBorder" },
			}

			--@usage[[ popup customization globly ]]
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border

				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end
		end

		--@usage[[ invoke customization ]]
		customize()

		local on_attach = function(client, bufnr)
			--@usage[[ Attach navic to lsp ]]
			--[[ if client.server_capabilities.documentSymbolProvider then ]]
			--[[ 	require("nvim-navic").attach(client, bufnr) ]]
			--[[ end ]]

			--@usage[[ Disable default formatter, it will be responsibility of null-ls ]]
			client.server_capabilities.document_formatting = false
		end

		local set_capabilities = function()
			local capabilities = lsp.protocol.make_client_capabilities()

			capabilities.textDocument.completion.completionItem.snippetSupport = true
			capabilities.textDocument.completion.completionItem.resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			}
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			return capabilities
		end

		local languages = require("plugins/lsp_languages")
		local servers = require("plugins/lsp_servers")

		for _, server in ipairs(servers) do
			require("lspconfig")[server].setup({
				on_attach = on_attach,
				capabilities = set_capabilities(),
				init_options = languages[server].init_options,
				settings = languages[server].settings,
				root_dir = languages[server].root_dir,
				filetypes = languages[server].filetypes,
			})
		end
	end
end

function M.lualine()
	return function()
		local lualine_loaded, lualine = pcall(require, "lualine")
		local colors_loaded, highlights = pcall(require, "colors.highlights")

		if not (lualine_loaded or colors_loaded) then
			return
		end

		local colors = highlights.colors
		local fn = vim.fn
		local cmd = vim.cmd

		local conditions = {
			buffer_not_empty = function()
				return fn.empty(fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = fn.expand("%:p:h")
				local gitdir = fn.finddir(".git", filepath .. ";")

				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		local config = {
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = { c = { fg = colors.fg, bg = colors.extraBg } },
					inactive = { c = { fg = colors.fg, bg = colors.extraBg } },
				},
			},
			sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		local get_mode_color = function()
			local mode_colors = {
				n = colors.blue,
				i = colors.green,
				c = colors.orange,
				v = colors.magenta,
				V = colors.magenta,
				R = colors.red,
			}
			local color = mode_colors[fn.mode()]

			if color == nil then
				color = colors.red
			end

			return color
		end

		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { left = 0, right = 1 },
		})

		ins_left({
			function()
				local alias = {
					n = "NORMAL",
					i = "INSERT",
					c = "COMMAND",
					v = "VISUAL",
					V = "VISUAL",
					R = "REPLACE",
					s = "SNIPPET",
				}
				local icons = {
					n = " ",
					i = " ",
					c = "גּ ",
					v = "﬏ ",
					V = "﬏ ",
					R = " ",
					s = " ",
				}
				cmd("hi! LualineMode guifg=" .. get_mode_color() .. " guibg=" .. colors.extraBg)

				local alias_mode = alias[fn.mode()]
				local icon = icons[fn.mode()]

				if not alias_mode then
					alias_mode = fn.mode()
				end

				if not icon then
					icon = " "
				end

				return icon .. alias_mode
			end,
			color = "LualineMode",
			padding = { left = 0, right = 1 },
			cond = conditions.hide_in_width,
		})

		-- ins_left({
		--   'filesize',
		--   cond = conditions.buffer_not_empty,
		-- })

		ins_left({
			"filename",
			color = { fg = colors.fg, gui = "bold" },
			cond = conditions.buffer_not_empty and conditions.hide_in_width,
		})

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.magenta, gui = "bold" },
			cond = conditions.hide_in_width,
		})

		ins_left({
			"diff",
			symbols = { added = " ", modified = "柳", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})

		ins_left({
			function()
				return "%="
			end,
			cond = conditions.hide_in_width,
		})

		-- ins_left({
		--   -- Lsp server name .
		--   function()
		--     local msg = 'No Active Lsp'
		--     local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
		--     local clients = vim.lsp.get_active_clients()
		--     if next(clients) == nil then
		--       return msg
		--     end
		--     for _, client in ipairs(clients) do
		--       local filetypes = client.config.filetypes
		--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
		--         return client.name
		--       end
		--     end
		--     return msg
		--   end,
		--   icon = '  LSP:',
		--   color = { fg = '#ffffff', gui = 'bold' },
		-- })

		ins_right({
			"location",
			color = { fg = colors.blue, gui = "bold" },
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"diagnostics",
			sources = { "nvim_diagnostic" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			diagnostics_color = {
				error = { fg = colors.red },
				warn = { fg = colors.orange },
				info = { fg = colors.blue },
				hint = { fg = colors.blue },
			},
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width,
		})

		ins_right({
			"filetype",
			padding = { left = 1, right = 1 },
		})

		ins_right({
			"o:encoding",
			fmt = string.upper,
			color = { fg = colors.green, gui = "bold" },
			padding = { left = 1, right = 1 },
			cond = conditions.hide_in_width,
		})

		-- ins_right({
		--   'fileformat',
		--   fmt = string.upper,
		--   icons_enabled = true,
		--   color = { fg = colors.green, gui = 'bold' },
		--   padding = { left = 1, right = 1 },
		-- })

		ins_right({
			"progress",
			padding = { left = 1, right = 1 },
			color = { fg = colors.orange, gui = "bold" },
			cond = conditions.hide_in_width,
		})

		ins_right({
			function()
				return "▊"
			end,
			color = { fg = colors.blue },
			padding = { right = 0 },
		})

		lualine.setup(config)
	end
end

function M.luasnip()
	return function()
		local luasnip_loaders_loaded, luasnip_loaders = pcall(require, "luasnip/loaders/from_vscode")

		if not luasnip_loaders_loaded then
			return
		end

		luasnip_loaders.lazy_load({
			paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
		})
	end
end

function M.mason()
	return function()
		local mason_loaded, mason = pcall(require, "mason")

		if not mason_loaded then
			return
		end

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "✗",
				},
			},
		})
	end
end

function M.mason_lspconfig()
	return function()
		local mason_lspconfig_loaded, mason_lspconfig = pcall(require, "mason-lspconfig")

		if not mason_lspconfig_loaded then
			return
		end

		local servers = require("plugins/lsp_servers")

		mason_lspconfig.setup({
			ensure_installed = servers,
		})
	end
end

function M.mason_null_ls()
	return function()
		local mason_null_ls_loaded, mason_null_ls = pcall(require, "mason-null-ls")
		local null_ls_loaded, null_ls = pcall(require, "null-ls")

		if not (mason_null_ls_loaded or null_ls_loaded) then
			return
		end

		mason_null_ls.setup({
			ensure_installed = {
				"autopep8",
				"clang_format",
				"prettier",
				"stylua",
			},
		})

		local formatting = null_ls.builtins.formatting

		mason_null_ls.setup_handlers({
			function(source_name, methods)
				-- [[ All sources with no handler get passed here ]]
				-- [[ Keep original functionality of `automatic_setup = true` ]]
				require("mason-null-ls.automatic_setup")(source_name, methods)
			end,
			autopep8 = function(_, _)
				null_ls.register(formatting.autopep8)
			end,
			clang_format = function(_, _)
				null_ls.register(formatting.clang_format)
			end,
			prettier = function(_, _)
				null_ls.register(formatting.prettier)
			end,
			stylua = function(_, _)
				null_ls.register(formatting.stylua)
			end,
		})
	end
end

function M.neoscroll()
	return function()
		local neoscroll_loaded, neoscroll = pcall(require, "neoscroll")
		local neoscroll_config_loaded, config = pcall(require, "neoscroll.config")

		if not (neoscroll_loaded or neoscroll_config_loaded) then
			return
		end

		neoscroll.setup({
			mappings = { "<C-u>", "<C-d>" },
			--@usage[[ Hide cursor while scrolling ]]
			hide_cursor = true,
			--@usage[[ Stop at <EOF> when scrolling downwards ]]
			stop_eof = true,
			--@usage[[ Use the local scope of scrolloff instead of the glob scope ]]
			use_local_scrolloff = false,
			--@usage[[ Stop scrolling when the cursor reaches the scrolloff margin of the file ]]
			respect_scrolloff = false,
			--@usage[[ The cursor will keep on scrolling even if the window cannot scroll further ]]
			cursor_scrolls_alone = true,
			--@usage[[ Default easing function ]]
			easing_function = nil,
			--@usage[[ Function to run before the scrolling animation starts ]]
			pre_hook = nil,
			--@usage[[ Function to run after the scrolling animation ends ]]
			post_hook = nil,
		})

		local mappings = {}
		mappings["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "100" } }
		mappings["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "100" } }

		config.set_mappings(mappings)
	end
end

function M.null_ls()
	return function()
		local null_ls_loaded, null_ls = pcall(require, "null-ls")

		if not null_ls_loaded then
			return
		end

		null_ls.setup()
	end
end

function M.nvimtree()
	return function()
		local nvimtree_loaded, nvimtree = pcall(require, "nvim-tree")

		if not nvimtree_loaded then
			return
		end

		local screen_width = vim.api.nvim_list_uis()[1].width
		local screen_height = vim.api.nvim_list_uis()[1].height
		local width = 100
		local height = 32

		nvimtree.setup({
			--@usage[[ disables netrw completely ]]
			disable_netrw = true,
			--@usage[[ hijack netrw window on startup ]]
			hijack_netrw = false,
			--@usage[[ open the tree when running this setup function ]]
			open_on_setup = false,
			--@usage[[ will not open on setup if the filetype is in this list ]]
			ignore_ft_on_setup = {},
			--@usage[[ enable/disable diagnostic in nvim tree ]]
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			--@usage[[ opens the tree when changing/opening a new tab if the tree wasn't previously opened ]]
			open_on_tab = false,
			--@usage[[ hijack the cursor in the tree to put it at the start of the filename ]]
			hijack_cursor = false,
			--@usage[[ changes the tree root directory on `DirChanged` and refreshes the tree ]]
			sync_root_with_cwd = false,
			renderer = {
				add_trailing = false,
				group_empty = false,
				highlight_git = false,
				full_name = false,
				highlight_opened_files = "none",
				root_folder_modifier = ":~",
				indent_width = 2,
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
			},
			--@usage[[ update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file ]]
			update_focused_file = {
				--@usage[[ enables the feature ]]
				enable = true,
				--@usage[[ Update the root directory of the tree if the file is not under current root directory ]]
				update_cwd = false,
				--@usage[[ list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory ]]
				--[[ only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true ]]
				ignore_list = {},
			},
			--@usage[[ configuration options for the system open command (`s` in the tree by default) ]]
			system_open = {
				--@usage[[ the command to run this, leaving nil should work in most cases ]]
				cmd = nil,
				--@usage[[ the command arguments as a list ]]
				args = {},
			},

			view = {
				preserve_window_proportions = true,
				--@usage[[ width of the window, can be either a number (columns) or a string in `%` ]]
				width = 35,
				--@usage[[ side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom' ]]
				side = "top",
				--@usage[[ hide root dir ]]
				hide_root_folder = false,
				mappings = {
					--@usage[[ custom only false will merge the list with the default mappings ]]
					--[[ if true, it will only use your list to set the mappings ]]
					custom_only = false,
					--@usage[[ list of mappings to set on the tree manually ]]
					list = {},
				},
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = width,
						height = height,
						row = (screen_height - height) * 0.5,
						col = (screen_width - width) * 0.5,
					},
				},
			},
		})
	end
end

function M.saga()
	return function()
		local saga_loaded, saga = pcall(require, "lspsaga")

		if not saga_loaded then
			return
		end

		saga.init_lsp_saga({
			--@usage[[ "single" | "double" | "rounded" | "bold" | "plus" ]]
			border_style = "rounded",
			--@usage[[ the range of 0 for fully opaque window (disabled) to 100 for fully ]]
			--[[ transparent background. Values between 0-30 are typically most useful. ]]
			saga_winblend = 0,
			--@usage[[ Error, Warn, Info, Hint ]]
			diagnostic_header = { " ", " ", " ", " " },
			--@usage[[ preview lines of lsp_finder and definition preview ]]
			max_preview_lines = 12,
			--@usage[[ use emoji lightbulb in default ]]
			--[[ code_action_icon = " ", ]]
			code_action_icon = " ",
			--@usage[[ same as nvim-lightbulb but async ]]
			code_action_lightbulb = {
				enable = true,
				enable_in_insert = true,
				cache_code_action = true,
				sign = false,
				update_time = 20,
				sign_priority = 20,
				virtual_text = true,
			},
			--@usage[[ press number to execute the codeaction in codeaction window ]]
			code_action_num_shortcut = true,
			--@usage[[ finder icons ]]
			finder_icons = {
				def = " ",
				ref = " ",
				link = " ",
			},
		})

		local map = function(...)
			vim.api.nvim_set_keymap("n", ...)
		end
		local opts = { silent = true, noremap = true }

		map("<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
		map("<leader>ga", "<cmd>Lspsaga code_action<CR>", opts)
		map("<leader>gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
		map("<leader>gk", "<cmd>Lspsaga hover_doc<CR>", opts)
		map("<leader>gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
		map("<leader>gl", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
		map("<leader>gn", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
		map("<leader>gp", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	end
end

function M.telescope()
	return function()
		local telescope_loaded, telescope = pcall(require, "telescope")
		local telescope_actions_loaded, actions = pcall(require, "telescope.actions")
		local telescope_sorters_loaded, sorters = pcall(require, "telescope.sorters")
		local telescope_previewers_loaded, previewers = pcall(require, "telescope.previewers")

		if
			not (
				telescope_loaded
				or telescope_actions_loaded
				or telescope_sorters_loaded
				or telescope_previewers_loaded
			)
		then
			return
		end

		telescope.setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "   ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.5,
					preview_cutoff = 120,
					horizontal = {
						mirror = false,
					},
					vertical = {
						mirror = false,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},
				mappings = {
					i = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-j>"] = actions.cycle_history_next,
						["<C-k>"] = actions.cycle_history_prev,
						["<CR>"] = actions.select_default,
					},
					n = {
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<CR>"] = actions.select_default,
					},
				},
				file_ignore_patterns = {
					"scratch/.*",
					"node_modules/.*",
					"build/.*",
					"dist/.*",
					".git/.*",
					".next/*",
				},
				path_display = {
					shorten = 6,
				},
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				disable_devicons = false,
				set_env = {
					["COLORTERM"] = "truecolor",
				},
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				file_sorter = sorters.get_fuzzy_file,
				generic_sorter = sorters.get_generic_fuzzy_sorter,
			},
			pickers = {
				find_files = {
					hidden = true,
					previewer = false,
				},
				buffers = {
					previewer = false,
				},
				live_grep = {
					--@usage[[ don't include the filename in the search results ]]
					only_sort_text = true,
					layout_config = {
						width = 0.75,
						preview_cutoff = 120,
						horizontal = {
							preview_width = function(_, cols, _)
								if cols < 120 then
									return math.floor(cols * 0.5)
								end

								return math.floor(cols * 0.6)
							end,
							mirror = false,
						},
						vertical = {
							mirror = false,
						},
					},
				},
			},
			extensions = {
				fzf = {
					--@usage[[ false will only do exact matching ]]
					fuzzy = true,
					--@usage[[ override the generic sorter ]]
					override_generic_sorter = true,
					--@usage[[ override the file sorter ]]
					override_file_sorter = false,
					--@usage[[ or "ignore_case" or "respect_case" ]]
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("fzf")
	end
end

function M.tokyonight()
	return function()
		local tokyonight_loaded, tokyonight = pcall(require, "tokyonight")

		if not tokyonight_loaded then
			return
		end

		tokyonight.setup({
			style = "night",
		})

		require("colors").init()
	end
end

function M.treesitter()
	return function()
		local treesitter_loaded, treesitter = pcall(require, "nvim-treesitter.configs")

		if not treesitter_loaded then
			return
		end

		treesitter.setup({
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = false,
				disable = {},
			},
			ensure_installed = {
				"scss",
				"kotlin",
				"lua",
				"python",
				"yaml",
				"regex",
				"make",
				"sql",
				"json",
				"dart",
				"haskell",
				"tsx",
				"jsonc",
				"toml",
				"query",
				"fish",
				"gitignore",
				"rust",
				"html",
				"css",
				"typescript",
				"c",
				"json5",
				"diff",
				"bash",
				"cmake",
				"vue",
				"comment",
				"jsdoc",
				"go",
				"javascript",
				"dockerfile",
			},
			ignore_install = { "phpdoc" },
			auto_install = true,
			playground = {
				enable = true,
				disable = {},
				--@usage[[ debounced time for highlighting nodes in the playground from source code ]]
				updatetime = 25,
				--@usage[[ whether the query persists across vim sessions ]]
				persist_queries = false,
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<CR>",
					show_help = "?",
				},
			},
			autotag = {
				enable = true,
			},
			rainbow = {
				enable = true,
				--@usage[[ list of disabled languages ]]
				-- disable     = { 'jsx', 'cpp' },
				--@usage[[ also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean ]]
				extended_mode = true,
				--@usage[[ do not enable for files with more than n lines, int ]]
				max_file_lines = nil,
				--@usage[[ table of hex strings ]]
				-- colors      = {},
				--@usage[[ table of colour name strings ]]
				-- termcolors  = {}
			},
		})
	end
end

function M.winbar()
	return function()
		local navic_loaded, navic = pcall(require, "nvim-navic")

		if not navic_loaded then
			return
		end

		navic.setup({
			highlight = true,
			separator = " ᐅ ",
			depth_limit = 0,
			depth_limit_indicator = "...",
			safe_output = true,
		})
	end
end

function M.fzf()
	return function()
		local fzf_loaded, fzf = pcall(require, "fzf-lua")

		if not fzf_loaded then
			return
		end

		local actions = require("fzf-lua.actions")

		fzf.setup({
			winopts = {
				height = 0.85,
				width = 0.80,
				row = 0.35,
				col = 0.50,
				border = "rounded",
				fullscreen = false,
				hl = {
					normal = "Normal",
					border = "FloatBorder",
					search = "IncSearch",
					title = "Normal",
				},
				preview = {
					border = "border",
					wrap = "nowrap",
					hidden = "nohidden",
					vertical = "down:45%",
					horizontal = "right:60%",
					layout = "flex",
					flip_columns = 120,
					title = false,
					title_align = "center",
					scrollbar = "border",
					scrolloff = "-2",
					scrollchars = { "", "" },
					delay = 100,
					winopts = {
						number = true,
						relativenumber = false,
						cursorline = false,
						cursorlineopt = "both",
						cursorcolumn = false,
						signcolumn = "no",
						list = false,
						foldenable = false,
						foldmethod = "manual",
					},
				},
			},
			keymap = {
				builtin = {
					["<S-down>"] = "preview-page-down",
					["<S-up>"] = "preview-page-up",
				},
				fzf = {
					["ctrl-d"] = "half-page-down",
					["ctrl-u"] = "half-page-up",
				},
			},
			actions = {
				files = {
					["ctrl-s"] = actions.file_split,
					["ctrl-v"] = actions.file_vsplit,
				},
				buffers = {
					["ctrl-s"] = actions.buf_split,
					["ctrl-v"] = actions.buf_vsplit,
				},
			},
			fzf_opts = {
				["--ansi"] = "",
				["--info"] = "inline",
				["--height"] = "100%",
				["--layout"] = "reverse",
				["--border"] = "none",
			},
			fzf_colors = {
				["header"] = { "fg", "Comment" },
			},
			files = {
				prompt = "Files❯ ",
				multiprocess = true,
				git_icons = true,
				file_icons = true,
				color_icons = true,
				find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
				rg_opts = "--color=never --files --hidden --follow -g '!.git'",
				fd_opts = "--color=never --type f --hidden --follow --exclude .git",
				actions = {
					["default"] = actions.file_edit,
				},
			},
			grep = {
				prompt = "Rg❯ ",
				input_prompt = "Grep For❯ ",
				multiprocess = true,
				git_icons = true,
				file_icons = true,
				color_icons = true,
				grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
				rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
				rg_glob = false,
				no_header = false,
				no_header_i = false,
				actions = {
					["default"] = actions.file_edit,
				},
			},
			buffers = {
				prompt = "Buffers❯ ",
				git_icons = true,
				file_icons = true,
				color_icons = true,
				sort_lastused = true,
				actions = {
					["default"] = actions.file_edit,
				},
			},
			diagnostics = {
				prompt = "Diagnostics❯ ",
				cwd_only = false,
				file_icons = true,
				git_icons = true,
				color_icons = true,
				diag_icons = true,
				icon_padding = "",
				actions = {
					["default"] = actions.file_edit,
				},
				signs = {
					["Error"] = { text = "", texthl = "DiagnosticError" },
					["Warn"] = { text = "", texthl = "DiagnosticWarn" },
					["Info"] = { text = "", texthl = "DiagnosticInfo" },
					["Hint"] = { text = "", texthl = "DiagnosticHint" },
				},
			},
			file_icon_padding = "",
		})
	end
end

return M
