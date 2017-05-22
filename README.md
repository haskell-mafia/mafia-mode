# mafia-mode

This repo is a complimentary mode to [dante](https://github.com/jyp/dante) which provides much 
of the functionality of `intero` without the requirement to use `stack`


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
  - [ ] Some kind of support for GHC version hopping
- [ ] Build and test support
  - [ ] Build in separate process buffer
  - [ ] Test in separate process buffer
  - [ ] Report errors
  - [ ] Projectile support (build project, etc)
- [x] Flycheck support
- [ ] Company support (type-directed code completion)
  - [ ] Port across the regexes from intero.el
- [ ] Proper error handling
  - [ ] Handle tools missing on path
- [ ] Spacemacs layer

## Usage

Tested with emacs 25.

For now, you need `mafia` and `ghc` on your PATH.

```elisp
(require 'use-package)

(use-package dante
             :ensure t
             :commands 'dante-mode
             :init
             (add-hook 'haskell-mode-hook 'dante-mode)
             (add-hook 'haskell-mode-hook 'flycheck-mode)
             (add-hook 'haskell-mode-hook 'mafia-mode))

```

Open a file inside a Haskell project, then hit `C-c C-a` to boot up a
repl. You now have a couple of handy features:
- `C-c C-a`: Add current buffer to the project repl (keeps existing targets)
- `C-c C-l`: Load current buffer in the project repl (replaces
  existing targets)
- `C-c C-r`: Reload the project repl

If something goes wrong, you can kill the repl process by killing its
buffer (`C-x C-k`).
