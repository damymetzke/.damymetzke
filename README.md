# .damymetzke, my personal settings

These are a collection of settings I personally use.
These are settings for:

- Alacritty
- Awesome
- Bash
- Git
- Neovim

Currently the configuration is poorly setup considering initial setup.
I will work on this later.

## Awesome

My awesome config is quite complex.
It is currently in a state I am not happy with,
and I plan to completely re-imagine it in the future.
However it does 2 things currently:

- It implements modes, which basically creates multiple sets of tags.
  I don't currently use this and plan on mostly abandoning this idea.
- It automatically manages tags on multiple screens.
  It uses a rollover method, where tags will be pushed back in the list.
  Basically the most recent selected tags will be visible.
  I plan on creating a separate repository for this in the future.

## Neovim

For Neovim I try to keep visual clutter to a minimum.
However I don't subscribe to the idea that Vim/Neovim should be as minimal as possible.
So I use quite a few plugins.
I won't explain all details in this README, but there are some noteworthy ideas.

The `nvim/lua` folder is divided as follows:

- `pack.lua` contains code for all packages
- `config/` contains configurations for specific plugins.
  This is done using the `config` key from `packer.nvim`.
  The name of the files always matches the full name of the plugin.
- `setup/` contains a list of files that will be executed once at startup.
  They run after the plugins have been set up.
- `share/` are scripts containing data that is used by other scripts.
- `util/` contains useful scripts that are utility focused

This setup currently has decent support for Java development using `jdtls`.
It is by no means complete, but I can manage to work at a reasonable speed.
And certainly faster than an IDE I don't use often.

Some keybinds are specific to a plugin.
Plugins can be lazy-loaded, so I only want to bind the keys when the plugin is loaded.
However I also like to have all my keybinds in a single file.
For this reason I decided to split the key definition from the implementation.
So any implementation is done in the configuration file of a plugin.
And the definition of the keys is done in `nvim/lua/setup/keybinds.lua`.
This is done using the `bridge_wrap` utility.
This utility only maps the key once *both* parts have been defined.

