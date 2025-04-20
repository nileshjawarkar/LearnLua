# Lua for Neovim
## Basics

- [Variables](./basics/ex1_variables.lua)
- [Functions](./basics/ex2_functions.lua)
- [Tables](./basics/ex3_table.lua)
- [Variable arguments for functions](./basics/ex4_varargs.lua)
- [Metatables](./basics/ex5_metatable.lua)

### Recommended videos
- [Basics - Start Writing Lua](https://www.youtube.com/watch?v=CuWfgiwI73Q&t=223s)

## Neovim lua API's

- [Neovim lua guide](https://neovim.io/doc/user/lua-guide.html#lua-guide)

This section explores neovim lua API's
.. In work ..

## Neovim plugin examples

Directory structure for plugins
``` txt
    PluginName.nvim                    --> Extension/postfix .nvim is optional but good to use it.
        |
        +-- lua                        --> plugin implementation will be here
        |    |
        |    +-- pluginName.lua        --> plugin implementation. This lua file can be have any name but
        +-- plugin                     --> its good to have same name as plugin name.
             |
             +-- loader.lua            --> Optional file. Name can be anything.
                                       --> Neovim will execute this file on plugin loading.
```

- [present.nvim](./plugins/present.nvim)

## Special thanks to TJ and others who helped and inspired me to learn Lua and Neovim.

- [TJ DeVries](https://github.com/tjdevries)
