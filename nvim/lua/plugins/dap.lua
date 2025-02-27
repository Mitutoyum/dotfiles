return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",

		"nvim-neotest/nvim-nio",
	},
	keys = {
		{
			"<F5>",
			require("dap").continue,
		},
		{
			"<F10>",
			require("dap").step_over,
		},

		{
			"<F11>",
			require("dap").step_into,
		},

		{
			"<F12>",
			require("dap").step_out,
		},

		{
			"<leader>B",
			require("dap").set_breakpoint,
		},
		{
			"<leader>lp",
			function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end,
		},
		{
			"<leader>dr",
			require("dap").repl.open,
		},
		{
			"<leader>dl",
			require("dap").run_last,
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			mode = { "n", "v" },
		},
		{
			"<leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
		},
		{
			"<leader>df",
			function()
				require("dap.ui.widgets").preview()
			end,
			mode = { "n", "v" },
		},
		{
			"<leader>ds",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			mode = { "n", "v" },
		},
	},
	config = function()
		local dap, dapui, mason_dap = require("dap"), require("dapui"), require("mason-nvim-dap")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dapui.setup()

		mason_dap.setup({
			handlers = {
				function(config)
					mason_dap.default_setup(config)
				end,
			},
		})
	end,
}
