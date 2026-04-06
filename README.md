# nvim-base

Repo intended to be used as a Neovim plugin in my config to allow sharing a core subset in both my private work configs and my personal at home config.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "trevorm4/nvim-base",
  name = "trevor",
  config = function()
    require("trevor")
  end
}
```

