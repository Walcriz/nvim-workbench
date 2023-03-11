local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

function M.new()
	local self = setmetatable(M, { __index = base_bench.new() })
	return self
end

function M:filepath()
	-- for git flow the branch name is something like feature/ch1234/branch_name
	local git_branch = utils.get_git_branch()
	local parsed_git_branch =
		vim.api.nvim_call_function("join", { vim.api.nvim_call_function("split", { git_branch, "/" }), "-" })
	return utils.workbench_path() .. "/" .. parsed_git_branch .. "-branchbench.md"
end

return M
