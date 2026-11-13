local M = {}

local function close_previous_terminal()
  local previous_buf = vim.g.runner_terminal_buf
  if previous_buf and vim.fn.bufexists(previous_buf) == 1 then
    vim.cmd("bdelete! " .. previous_buf)
  end
end

function M.run(command)
  vim.cmd("write")
  close_previous_terminal()
  vim.cmd("below terminal " .. command)
  vim.g.runner_terminal_buf = vim.api.nvim_get_current_buf()
end

return M
