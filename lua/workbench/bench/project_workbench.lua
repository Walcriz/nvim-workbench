local M = {}
local utils = require("workbench.utils")
local base_bench = require("workbench.bench")

function M.new()
	local self = setmetatable(M, { __index = base_bench.new() })
	return self
end

function M:filepath()
	return utils.workbench_path() .. "/" .. "workbench.md"
end

return M
