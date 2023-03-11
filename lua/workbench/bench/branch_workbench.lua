local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

setmetatable(M, {
	__call = function(_, ...)
		return M.new(...)
	end,
})

function M.new()
	local self = setmetatable(base_bench:new(), { __index = M })
	return self:init()
end

function M:filepath()
	-- for git flow the branch name is something like feature/ch1234/branch_name
	local git_branch = utils.get_git_branch()
	local parsed_git_branch =
		vim.api.nvim_call_function("join", { vim.api.nvim_call_function("split", { git_branch, "/" }), "-" })
	return utils.workbench_path() .. "/" .. parsed_git_branch .. "-branchbench.md"
end

return M
