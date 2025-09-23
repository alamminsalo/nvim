vim.o.laststatus = 1 -- Always show statusline

-- Show mode as short name
local function mode()
  local modes = {
    n = 'N', i = 'I', v = 'V', [''] = 'V-B', V = 'V-L',
    c = 'C', no = 'N?', s = 'S', S = 'S-L', [''] = 'S-B',
    ic = 'I-C', R = 'R', Rv = 'V-R', cv = 'Ex', ce = 'Ex', r = 'R',
    rm = 'M', ['r?'] = '?', ['!'] = '!',
  }
  return modes[vim.api.nvim_get_mode().mode] or '?'
end

-- Git branch using Fugitive
local function git_branch()
  local branch = vim.fn.FugitiveHead and vim.fn.FugitiveHead() or ''
  return branch ~= '' and (' ' .. branch) or ''
end

-- CoC status
local function coc_status()
  return vim.fn['coc#status']()
end

-- Set statusline
vim.o.statusline = table.concat({
  '%#StatusLine#',
  ' %{v:lua.mode()} ',        -- mode
  ' %f',                     -- file path
  '%m',                       -- modified flag
  ' %#StatusLineNC#',
  ' %=',
  '%{v:lua.git_branch()}',    -- git
  ' %{v:lua.coc_status()}',   -- CoC status
  '  %y',                    -- filetype
  '  %l:%c ',                -- line/col
})

-- Expose Lua functions to Vimscript
_G.mode = mode
_G.git_branch = git_branch
_G.coc_status = coc_status
