local project_workbench = require("workbench.bench.project_workbench"):new()
local branch_workbench = require("workbench.bench.branch_workbench"):new()

local workbench = {}

workbench.toggle_branch_workbench = function()
	branch_workbench:toggle()
end

workbench.toggle_project_workbench = function()
	project_workbench:toggle()
end

return workbench
