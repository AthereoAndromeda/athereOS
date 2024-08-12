{lib}: s:
lib.concatStrings [
  (lib.toUpper (builtins.substring 0 1 s))
  (builtins.substring 1 (builtins.stringLength s) s)
]
