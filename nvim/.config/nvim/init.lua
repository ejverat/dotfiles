-- If the first load, then install packer
if require "boot.first_load"() then
  return
end

require "common"
require "plugins"
require "colors"
require "mappings"
require "lsp_ccls"
require "lsp_lua"
