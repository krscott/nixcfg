local otter = require('otter')

--[[
-- table of embedded languages to look for.
-- default = nil, which will activate
-- any embedded languages found
local languages = { 'python', 'lua' }

-- enable completion/diagnostics
-- defaults are true
local completion = true
local diagnostics = true
-- treesitter query to look for embedded languages
-- uses injections if nil or not set
local tsquery = nil

otter.activate(languages, completion, diagnostics, tsquery)
--]]

otter.activate()
