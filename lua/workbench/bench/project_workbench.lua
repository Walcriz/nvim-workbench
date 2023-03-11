local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

function M:new()
	local o = base_bench:new()
	setmetatable(o, self)
	self.__index = self
	return o
end

function M:filepath()
	return utils.workbench_path() .. "/" .. "workbench.md"
end

return M
