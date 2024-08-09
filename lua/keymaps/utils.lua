local M = {}

--- Converts a value into talbe.
--- @param arg nil | table | any
local function to_table(arg)
  return type(arg) == 'table' and arg or arg and { arg } or {}
end

--- Create key options.
--- @param description string is mandatory
--- @param buffer_or_opts table | number | nil
--- @return any
function M.key_opts(description, buffer_or_opts)
  local is_opts = type(buffer_or_opts) == 'table'
  local is_buffer = type(buffer_or_opts) == 'number'

  local default_opts = {
    buffer = is_buffer and buffer_or_opts,
    desc = description,
    noremap = true,
    nowait = true,
    silent = true,
  }

  return vim.tbl_extend('force', default_opts, is_opts and buffer_or_opts or {})
end

--- Check if a key binding is already mapped in the specified modes.
--- @param lhs string The key binding.
--- @param modes string | string[] Modes to check.
--- @return boolean true if used
local function is_used(lhs, modes)
  modes = to_table(modes)

  for _, mode in ipairs(modes) do
    local existing = vim.fn.maparg(lhs, mode)

    -- todo: it blocks now to create longer mappings with same kyes, for example it will not allow to setup `gcc` if `gc` is used already.
    if existing ~= '' then
      local timer = vim.loop.new_timer()
      timer:start(5000, 0, function() -- todo: find better way to notify errors
        vim.notify(
          'Mapping for "'
            .. lhs
            .. '" in mode "'
            .. mode
            .. '" already exists for `'
            .. existing
            .. '`. The binding is ignored.',
          4 -- error
        )
      end)
      return true
    end
  end

  return false
end

--- Set mapping for a key with default options.
--- If it's required to setup and a buffer and options and a descption, then pass a buffer and a descrioption inside options.
--- comment
--- @param lhs string
--- @param rhs string | function
--- @param description string is mandatory
--- @param buffer_or_opts table | number | nil
--- @param modes string | string[] | nil { Normal, Visual, Select, Operator-pending } if `nil`
--- @param force boolean | nil
function M.map(lhs, rhs, description, modes, buffer_or_opts, force)
  modes = modes or { 'n', 'v', 'o' }
  if not force and is_used(lhs, modes) then
    return
  end
  -- todo: if rhs is nop just add description in which key.
  local opts = M.key_opts(description, buffer_or_opts)
  vim.keymap.set(modes, lhs, rhs, opts)
end

--- Remove extra items.
--- @param mapping table
local function clean_opts(mapping)
  mapping[1] = nil
  mapping[2] = nil
  mapping[3] = nil
  mapping.m = nil
  mapping.modes = nil
  mapping.force = nil
end

--- Set multiple mappings.
--- @param mappings any example: { lhs, rhs, desc, ...opts, [modes|m] = [{ '!', 'v' }|'n'], force = true };
--- where `modes` is a string or a table; Normal, Visual, Select, Operator-pending if `nil`.
--- all other options are passed as is `opts`.
function M.map_keys(mappings)
  for _, opts in ipairs(mappings) do
    local has_modes = opts.m ~= nil or opts.modes ~= nil
    local modes = has_modes and vim.tbl_deep_extend('force', to_table(opts.m), to_table(opts.modes)) or nil
    local lhses = to_table(opts[1])
    local rhs = opts[2]
    local desc = opts[3]
    local force = opts.force

    clean_opts(opts)

    for _, lhs in ipairs(lhses) do
      M.map(lhs, rhs, desc, modes, opts, force)
    end
  end
end

return M
