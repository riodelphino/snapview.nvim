# viewsnap.nvim

'viewsnap.nvim' keeps your current cursor & scroll positions, if you back to the old buffers.   
So your eyes don't have to search the cursor arround.

I recommend this plugin below for same purpose. It allows you to save views between sessions.
[https://github.com/ecthelionvi/NeoView.nvim](https://github.com/ecthelionvi/NeoView.nvim)


## Function
- Save current cursor position & scroll position in `BufLeave`.
- Restore the positions in `BufEnter`.
- Restore the positions, when you re-open the old buffers which you closed before.


## Install

Packer
```lua
use("riodelphino/viewsnap.nvim")
```


## Config

No configuration is required.


## Usage

1. Open a buffer.
2. Change the cursor position & scroll.
3. Open another buffer.
4. Back to the first buffer.
5. The cursor & scroll positions are reserved.


## Thanks

Thanks for this old article for vim.

Avoid scrolling when switch buffers | Vim Tips Wiki | Fandom
[https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers](https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers)

I convert all the code to lua, and make it to a plugin.
That's all.

(Sorry, in conversion, some features might have been lost.)


## Lisence
MIT
