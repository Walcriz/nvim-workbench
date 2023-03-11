local project_workbench = {
	base = require("workbench.bench"):new(),
}
local utils = require("workbench.utils")

function project_workbench.filepath()
	return utils.workbench_path() .. "/" .. "workbench.md"
end

function project_workbench.initialize()
	project_workbench.base:init()
end

function project_workbench.toggle()
	project_workbench.base:toggle()
end

return project_workbench