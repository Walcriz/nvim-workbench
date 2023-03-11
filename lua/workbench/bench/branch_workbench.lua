local branch_workbench = {}
local utils = require("workbench.utils")

function branch_workbench.filepath()
	-- for git flow the branch name is something like feature/ch1234/branch_name
	local git_branch = utils.get_git_branch()
	local parsed_git_branch =
		vim.api.nvim_call_function("join", { vim.api.nvim_call_function("split", { git_branch, "/" }), "-" })
	return utils.workbench_path() .. "/" .. parsed_git_branch .. "-branchbench.md"
end

function branch_workbench.initialize()
	branch_workbench.base:init()
end

function branch_workbench.toggle()
	branch_workbench.base:toggle()
end

return branch_workbench
