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

-- rsyncing local/remote files
function M.get_file_name()
  return vim.fn.resolve(vim.fn.expand('%:t'))
end

function M.get_file_absolute_path()
  -- Absolute path of file in current buffer:
  return vim.fn.resolve(vim.fn.expand('%:p'))
end

function M.substring_match(str1, str2)
  return string.find(str1, str2) ~= nil
end

function M.file_belongs_to_repo(repo)
  local fpath = M.get_file_absolute_path()
  return  M.substring_match(fpath, repo)
end

function M.get_file_paths(repo_name)
  local local_repo_parent = require('private-config').local_repo_parent
  local local_repo_root =  local_repo_parent .. "%/" .. repo_name
  local local_source = M.get_file_absolute_path()

  return {local_repo_parent, local_repo_root, local_source}
end

function M.sync_source_target(paths)
  local local_repo_parent = paths[1]
  local local_source = paths[3]

  -- get path relative to repo root dir
  local subpath = string.gsub(local_source,local_repo_parent,"")

  -- adjust space in repo name
  local_source = string.gsub(local_source," ", "%\\ ")

  -- set remote path
  local remote_target = require('private-config').remote_path .. subpath

  print("Saving and syncing with Acropolis server...")
  print(string.format("%s%s", 'source: ', local_source))
  print(string.format("%s%s", 'target: ', remote_target))
  local vimscript_cmd=string.format('%s%s%s%s', 
                                    ':w | !rsync -avhP ',
                                    local_source, " ",
                                    remote_target)
  vim.api.nvim_command(vimscript_cmd)
  print("Done!")
end

function M.sync_with_server()
  local bm_paths = M.get_file_paths("bond%-model")
  local bd_paths = M.get_file_paths("bond%-data")

  if M.file_belongs_to_repo(bm_paths[2]) then
    M.sync_source_target(bm_paths)
  elseif M.file_belongs_to_repo(bd_paths[2]) then
    M.sync_source_target(bd_paths)
  else
    print('file does not belong to a remote repo. Exiting...')
  end
end

return M

-- local os_name = vim.loop.os_uname().sysname
-- local computer_name = vim.loop.os_gethostname()
