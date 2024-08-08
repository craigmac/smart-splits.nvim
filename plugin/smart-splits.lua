local cmds = require('smart-splits.commands')

if not vim.api.nvim_create_user_command then
  -- from commit: https://github.com/mrjones2014/smart-splits.nvim/blob/0c7cee73a16fe4d1ac4bc359f35ca0e0aa02c336/plugin/smart-splits.lua
  vim.cmd([[
  " resizing
  command! -nargs=* SmartResizeLeft :lua require('smart-splits').resize_left(<args>)<CR>
  command! -nargs=* SmartResizeRight :lua require('smart-splits').resize_right(<args>)<CR>
  command! -nargs=* SmartResizeUp :lua require('smart-splits').resize_up(<args>)<CR>
  command! -nargs=* SmartResizeDown :lua require('smart-splits').resize_down(<args>)<CR>
  " movements
  command! SmartCursorMoveLeft :lua require('smart-splits').move_cursor_left()<CR>
  command! SmartCursorMoveRight :lua require('smart-splits').move_cursor_right()<CR>
  command! SmartCursorMoveUp :lua require('smart-splits').move_cursor_up()<CR>
  command! SmartCursorMoveDown :lua require('smart-splits').move_cursor_down()<CR>
  ]])
else
  vim.tbl_map(function(cmd)
    vim.api.nvim_create_user_command(cmd[1], cmd[2], cmd[3])
  end, cmds)
end

require('smart-splits.config').set_default_multiplexer()
require('smart-splits.mux.utils').startup()
