local terminal_runner = require("config.terminal_runner")

local function execute_python()
  local venv = vim.env.VIRTUAL_ENV
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))

  if venv and venv ~= "" then
    terminal_runner.run(vim.fn.shellescape(venv .. "/bin/python") .. " " .. file)
  elseif vim.fn.isdirectory("./env") == 1 then
    terminal_runner.run("./env/bin/python " .. file)
  elseif vim.fn.isdirectory("./.venv") == 1 then
    terminal_runner.run("./.venv/bin/python " .. file)
  elseif vim.fn.isdirectory("./../env") == 1 then
    terminal_runner.run("./../env/bin/python " .. file)
  elseif vim.fn.isdirectory("./../.venv") == 1 then
    terminal_runner.run("./../.venv/bin/python " .. file)
  else
    terminal_runner.run("python3 " .. file)
  end
end

vim.keymap.set("n", "<localleader>r", execute_python,
  { buffer = true, desc = "Run Python in venv" })
