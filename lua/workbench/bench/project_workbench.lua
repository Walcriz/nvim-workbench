local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

function M.new()
	local self = setmetatable(base_bench.new(), { __index = M })
	return self
end

function M:filepath()
	return utils.workbench_path() .. "/" .. "workbench.md"
end

return M
