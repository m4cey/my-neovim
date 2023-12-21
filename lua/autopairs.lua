local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
    }
})
npairs.add_rule(Rule("$", "$","typst"))
