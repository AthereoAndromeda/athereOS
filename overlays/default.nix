{inputs}: [
  (
    import
    ./anytype.nix
  )
  (
    import
    ./zjstatus.nix
    {zjstatus = inputs.zjstatus;}
  )
  (
    import ./anurati.nix
  )
]
