# mafia-mode

This repo houses a port of
[intero.el](https://github.com/commercialhaskell/intero/blob/master/elisp/intero.el).
It has been rewired to remove `stack`, and currently uses `mafia`.

Since it is little more than regex running over a `ghci` process, it
would make sense to make the `ghci` invocation configurable down the
track, so users of plain `cabal` and `ghci` can also benefit.
