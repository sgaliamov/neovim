local M = {}

function M.set_key(mode, lhs, rhs, desc, buffer)
    local opts = M.key_opts(desc, buffer)

    -- Check if the mapping already exists
    local is_mapped = vim.fn.maparg(lhs, mode) ~= ''

    if not is_mapped then
        vim.keymap.set(mode, lhs, rhs, opts)
    else
        vim.notify("Mapping for '" .. lhs .. "' in mode '" .. mode .. "' already exists.", "error") -- todo: show at startup.
    end
end

function M.set_keys(mode, mappings, buffer)
    for keys, mapping in pairs(mappings) do
        M.set_key(mode, keys, mapping[1], mapping[2], buffer)
    end
end

function M.key_opts(desc, buffer, opts)
    local default_opts = {
        buffer = buffer,
        desc = desc,
        noremap = true,
        nowait = true,
        silent = true
    }

    return vim.tbl_extend('force', default_opts, opts or {})
end

return M
