# hexscope for Homebrew

[hexscope](https://hexscope.org) shows what a file gives away — location,
camera serial, author, tracked changes, text under black boxes — and saves a
clean copy, on your own machine.

```sh
brew install mykytastel/hexscope/hexscope
hexscope check photo.jpg
hexscope clean --verify photo.jpg
```

To clean files from Finder's right-click menu (Quick Actions), run once:

```sh
hexscope menu
```

The formula installs the command built for each release of
[MykytaStel/hexscope](https://github.com/MykytaStel/hexscope/releases), each
checked against the checksum the release carries. It is written by
`scripts/homebrew-formula.mjs` in that repository; changes go there.
