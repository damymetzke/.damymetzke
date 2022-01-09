# .damymetzke, my personal settings

These are a collection of settings I personally use.
These are settings for:

- Alacritty
- Awesome
- Bash
- Git
- Vim

If you want to use this as a starting point for your own settings you should consider changing the name of the folder.
`/bash/exports.sh` exports the environment variable `$CUSTOM_USER_CONFIG`.
Update this value to change the folder name.

All configuration is both modular and explained with comments.

## Awesome

The awesome configuration is quite complex and almost its own program.
So this is a quick explanation about how it works.

First of all the window manager uses a mode system.
There are a number of modes defined, which are currently bound to Super+1, Super+2, etc.
Each mode has their own set of tags, which changes which tags are used.
Basically pressing alt+6 brings up a different tag depending on the active mode.

> The content below is yet to be implemented

Secondly the way multiple monitors are managed is slightly different than usual.
Rather than switching between monitors, the configuration tries to enforce the use of a single *working* monitor.
This is to say, any program directly being used is always on the primary monitor.
The secondary monitor is only used to view things.

The above system is supplemented using 'locked tags'.
Normally the configuration tries to keep the last used tags on the monitors.
This results in tags being rotated trough the screens.
The exception is when a tag is locked to a screen.
This tag will remain on the locked screen, unless it is selected.
In that case it is swapped with the current primary tag.
When selecting any other tag the locked tag will move back to the screen it had been locked to.

