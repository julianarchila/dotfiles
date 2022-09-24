function safe_require(name)
    local status_ok, module = pcall(require, name)
    if not status_ok then
        vim.notify("error loading module " .. name .. "\t" .. module)
        return nil
    end
    return module
end

return {
    safe_require = safe_require
}
