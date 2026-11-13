local terminal_runner = require("config.terminal_runner")

local function execute_java()
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  terminal_runner.run("java " .. file)
end

vim.keymap.set("n", "<localleader>r", execute_java,
  { buffer = true, desc = "Run Java file" })
