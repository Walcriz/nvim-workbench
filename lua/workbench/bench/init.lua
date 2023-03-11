local utils = require("workbench.utils")

local M = {}

function M.new()
	local self = setmetatable({}, { __index = M })

	self.bufnr = vim.api.nvim_create_buf(false, true)
	self.was_initialized = false

	return self
end

function M:init()
	self.was_initialized = true

	--Get the current UI
	self.ui = vim.api.nvim_list_uis()[1]

	local width = round(ui.width * 0.5)
	local height = round(ui.height * 0.5)

	self.win_id = vim.api.nvim_open_win(M.bufnr, true, utils.window_config(width, height))

	local open_file_cmd = "e " .. self.filepath()
	vim.api.nvim_command(open_file_cmd)
end

function M:toggle()
	-- early return if not a git repo
	if utils.is_git_repo() ~= "true" then
		return vim.api.nvim_err_writeln("Sorry, Workbench only works in a Git Repo")
	end

	if utils.directory_not_exist(utils.workbench_path()) then
		utils.create_directory()
	end

	-- override ui every time toggle is called
	self.ui = vim.api.nvim_list_uis()[1]

	local buf_hidden = 0
	local buf_info = vim.api.nvim_call_function("getbufinfo", { self.filepath() })[1]

	if buf_info then
		buf_hidden = buf_info.hidden
	end

	local current_bufnr = vim.api.nvim_win_get_buf(0)

	if not self.was_initialized then
		self.initialize()
	elseif current_bufnr == self.bufnr then
		utils.hide_workbench()
	elseif buf_hidden == 0 and buf_info.windows[1] then
		vim.api.nvim_set_current_win(buf_info.windows[1])
	else
		utils.show_workbench(self.bufnr)
	end
end

return M
