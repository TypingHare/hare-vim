# Next Overhaul Idea

So, the thing is, for every project, I want a different buffer configuration, and I want Neovim to read maybe `.config/hare.json` from the project root directory.

Also, some plugins should NOT be used in some environment. For instance, I want to use a pure Neovim with limited plugins on a Linux server. I need to define a "package" system, where plugins are separated in different packages, and so as language supports (like buffer configuraiton).

For instance, `lua/hare/packages/standard/` is the `standard` package, and `lua/hare/packages/python` is the `python` package.

Make a better architecture, put the architetural code in `lua/hare/kernel`.
