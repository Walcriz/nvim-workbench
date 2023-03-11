local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

function M:new()
	o = base_bench:new()
	setmetatable(o, self)
	self.__index = self
	return o
end

function M:filepath()
	return utils.workbench_path() .. "/" .. "workbench.md"
end

Project_Workbench = Project_Workbench or M:new()

return Project_Workbench
