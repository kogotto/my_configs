local M = {}

-- Convinient function to print tables and functions in
-- human readable format, mostly for debug
local _tableToStr

local INDENT_OFFSET = string.rep(' ', 4)
local function getOffset(level)
    return string.rep(INDENT_OFFSET, level)
end

local _functionToString = function(func)
    local funcInfo = debug.getinfo(func)
    return string.format('<function defined in %s:[%s, %s]>',
        funcInfo.source, funcInfo.linedefined, funcInfo.lastlinedefined)
end

local SERIALIZERS = {
    ['function'] = _functionToString,
    -- TODO add serializators for other types
}

local function _serialize(value)
    local serializator = SERIALIZERS[type(value)] or tostring
    return serializator(value)
end

local function _serializeValue(value, level, currentOffset)
    if type(value) == 'table' then
        return _tableToStr(value, level, currentOffset)
    end
    return _serialize(value)
end


_tableToStr = function(source, level, currentOffset)
    if level > 3 then
        return '{...}'
    end
    currentOffset = currentOffset or ''
    local tableOffset = getOffset(level)
    local itemsOffset = getOffset(level+1)
    local itemFormat = currentOffset .. itemsOffset .. '[%s] = %s,'
    local function formatItem(k, v)
        return string.format(itemFormat,
            _serialize(k), _serializeValue(v, level+1, currentOffset)
        )
    end
    local function getItemStrs(value)
        local result = {}
        for k, v in pairs(value) do
            table.insert(result, formatItem(k, v) )
        end
        return result
    end

    local header = '{\n'
    local body = table.concat(getItemStrs(source), '\n') .. '\n'
    local footer = currentOffset .. tableOffset .. '}'

    return header .. body .. footer
end

M.function_ = _functionToString

M.table = function(value)
    if type(value) ~= 'table' then
        error('Parameter not a table')
    end
    return _tableToStr(value, 0)
end

return M
