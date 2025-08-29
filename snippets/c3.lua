local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('mod', {
    t 'module ',
    i(1, 'name'),
    t ';',
  }),
  s('alias', {
    t 'alias ',
    i(1, 'Name'),
    t ' = fn ',
    i(2),
    t ';',
  }),
}
