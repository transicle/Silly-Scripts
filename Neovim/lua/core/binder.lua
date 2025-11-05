--[[

    Keybind manager for Neovim
    Converts human-readable shortcuts into Neovim-compatible keymaps.

    October 11th, 2025 (improved Nov 2025)

]]

local KeybindManager = {}

local keys = {
    a="a", b="b", c="c", d="d", e="e", f="f", g="g", h="h", i="i", j="j",
    k="k", l="l", m="m", n="n", o="o", p="p", q="q", r="r", s="s", t="t",
    u="u", v="v", w="w", x="x", y="y", z="z",

    ["0"]="0", ["1"]="1", ["2"]="2", ["3"]="3", ["4"]="4", ["5"]="5",
    ["6"]="6", ["7"]="7", ["8"]="8", ["9"]="9",

    f1="F1", f2="F2", f3="F3", f4="F4", f5="F5", f6="F6", f7="F7", f8="F8",
    f9="F9", f10="F10", f11="F11", f12="F12",

    up="Up", down="Down", left="Left", right="Right",

    num0="Num0", num1="Num1", num2="Num2", num3="Num3", num4="Num4", num5="Num5",
    num6="Num6", num7="Num7", num8="Num8", num9="Num9", numenter="Enter",
    ["num+"]="+", ["num-"]="-", ["num*"]="*", ["num/"]="/",

    ctrl="C", control="C", lctrl="C", rctrl="C",
    alt="A", option="A", lalt="A", ralt="A",
    shift="S", lshift="S", rshift="S",
    cmd="D", super="D", meta="D",

    enter="CR", return_key="CR", space="Space", tab="Tab",
    esc="Esc", escape="Esc", backspace="BS", delete="Del", del="Del",
    home="Home", ["end"]="End", pageup="PageUp", pagedown="PageDown",

    ["-"]="-", ["="]="=", ["["]="[", ["]"]="]", ["\\"]="\\", [";"]=";", ["'"]="'",
    [","]=",", ["."]=".", ["/"]="/", ["`"]="`", ["~"]="~",
    ["!"]="!", ["@"]="@", ["#"]="#", ["$"]="$", ["%"]="%", ["^"]="^",
    ["&"]="&", ["*"]="*", ["("]="(", [")"]=")", ["_"]="_", ["+"]="+",
    ["|"]="|", [":"]=":", ['"']='"', ["<"]="<", [">"]=">"
}

function KeybindManager.parse(human_key)
    if not human_key or human_key == "" then
        return ""
    end

    human_key = human_key:lower():gsub("%s*%+%s*", "+"):gsub("%s+", " ")

    local parts = {}
    for part in human_key:gmatch("[^%+]+") do
        table.insert(parts, part)
    end

    local mapped = {}
    local main_key = parts[#parts]

    for i = 1, #parts-1 do
        local mod = keys[parts[i]]
        if mod and not vim.tbl_contains(mapped, mod) then
            table.insert(mapped, mod)
        end
    end

    table.insert(mapped, keys[main_key] or main_key:upper())

    return "<" .. table.concat(mapped, "-") .. ">"
end

function KeybindManager.map(mode, key, action, opts)
    opts = vim.tbl_extend("force", {
        noremap = true,
        silent = true
    }, opts or {})

    local parsed = KeybindManager.parse(key)
    if parsed == "" then
        vim.notify("KeybindManager: invalid key '" .. tostring(key) .. "'", vim.log.levels.WARN)
        return
    end

    vim.keymap.set(mode, parsed, action, opts)
end

return KeybindManager
