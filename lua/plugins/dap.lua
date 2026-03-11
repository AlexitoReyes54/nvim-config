return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.adapters.node = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter" },
		}

		dap.adapters.firefox = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/path/to/vscode-firefox-debug/dist/adapter.bundle.js" },
		}

		dap.adapters["pwa-node"] = {
			type = "server",
			host = "127.0.0.1",
			port = 8123,
			executable = {
				command = "js-debug-adapter",
			},
		}

		dap.configurations.typescript = {
			{
				name = "launch file",
				type = "pwa-node",
				request = "launch",
				cwd = "${workspaceFolder}",
			},

		}

		-- Abrir/cerrar UI automáticamente al iniciar/terminar debug
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
	end,
}
