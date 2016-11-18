# mafia-mode

This repo houses a port of
[intero.el](https://github.com/commercialhaskell/intero/blob/master/elisp/intero.el).
It has been rewired to remove `stack`, and currently uses `mafia`.

Since it is little more than regex running over a `ghci` process, it
would make sense to make the `ghci` invocation configurable down the
track, so users of plain `cabal` and `ghci` can also benefit.

## Status

This is still in a very WIP state, basically a Yak Day hack that
stopped once a repl was popped.

### Features

Here is a list of the various glaring holes, if you'd like to contribute:

- [ ] REPL
  - [X] Start repl via `mafia quick`
  - [X] Load current buffer in project repl
  - [X] Add current buffer to project repl
  - [ ] Kill or restart repl process
  - [ ] Add glob to project repl (`mafia quick src/**/*.hs`)
  - [ ] Add buffer to a different repl (e.g. load Test.P.Bool in the
    `p` repl, rather than `p-test`)
  - [ ] Work properly for standalone Haskell files (outside projects)
- [ ] Type at point
  - [ ] Configurable alternative GHCi invocations, e.g. `intero`,
    `ghci`, `cabal repl`, `stack ghci`
  - [ ] Port across the regexes from intero.el
  - [ ] Keep the repl buffer hidden
- [ ] Build and test support
- [ ] Flycheck support
  - [ ] Port across the regexes from intero.el
  - [ ] ???
- [ ] Company support
  - [ ] Port across the regexes from intero.el
- [ ] Proper error handling
- [ ] Spacemacs layer

## Usage

Only tested in Emacs 24.

For now, you need `mafia` and `ghc` on your PATH.

```elisp
(add-to-list 'load-path "~/.emacs.d/mafia-mode/")
(require 'mafia)
(add-hook 'haskell-mode-hook #'mafia-mode)
```

Open a file inside a Haskell project, then hit `C-c C-z` to boot up a
repl. You now have a couple of handy features:
- `C-c C-a`: Add current buffer to the project repl (keeps existing targets)
- `C-c C-l`: Load current buffer in the project repl (replaces
  existing targets)
- `C-c C-r`: Reload the project repl

If something goes wrong, you can kill the repl process by killing its
buffer (`C-x C-k`).
