local M = {}

function M.get_os_name()
  return vim.loop.os_uname().sysname
end

function M.is_darwin()
  return M.get_os_name() == 'Darwin'
end

function M.is_linux()
  return M.get_os_name() == 'Linux'
end

function M.get_computer_name()
  return vim.loop.os_gethostname()
end

function M.is_home_computer()
  local os_name = M.get_os_name()
  local computer_name = M.get_computer_name()

  return os_name == "Darwin" and computer_name == "ab-osx"
end

function M.file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.has_private_settings()
  return M.file_exists(os.getenv("LUADIR") .. "" .."/private-config.lua")
end

function M.scp_repo(repo_name)
 local tmp =string.format('%s%s%s%s',
                          'e ',
                          require('private-config').remote_scp_prefix,
                          require('private-config').remote_dir .. "/" ,
                          repo_name .. "/")
 vim.api.nvim_command(tmp)
end


return M

-- local os_name = vim.loop.os_uname().sysname
-- local computer_name = vim.loop.os_gethostname()
-- local is_home_computer = os_name == "Darwin" and computer_name == "ab-osx"

