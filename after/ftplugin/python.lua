local function execute_python()
  
  vim.cmd("w")

  if vim.g.python_exec_term_buf and vim.fn.bufexists(vim.g.python_exec_term_buf) == 1 then
    vim.cmd("bdelete! " .. vim.g.python_exec_term_buf)
  end

  local venv = vim.env.VIRTUAL_ENV
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))

  if venv and venv ~= "" then
    vim.cmd("below terminal " .. vim.fn.shellescape(venv .. "/bin/python") .. " " .. file)
  elseif vim.fn.isdirectory("./env") == 1 then
    vim.cmd("below terminal ./env/bin/python " .. file)
  elseif vim.fn.isdirectory("./.venv") == 1 then
    vim.cmd("below terminal ./.venv/bin/python " .. file)
  elseif vim.fn.isdirectory("./../env") == 1 then
    vim.cmd("below terminal ./../env/bin/python " .. file)
  elseif vim.fn.isdirectory("./../.venv") == 1 then
    vim.cmd("below terminal ./../.venv/bin/python " .. file)
  else
    vim.cmd("below terminal python3 " .. file)
  end

  vim.g.python_exec_term_buf = vim.fn.bufnr("$")
end

vim.keymap.set("n", "<localleader>r", execute_python,
  { buffer = true, desc = "Run Python in venv" })
