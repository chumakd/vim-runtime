syntax enable
set colorcolumn=

syntax match ZfsSnap "@.*$"
highlight link ZfsSnap Comment

syntax match ZfsDataset "\(^\|─ \)\zs\w\+"
highlight link ZfsDataset WinBar
