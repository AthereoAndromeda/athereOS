{inputs}: [
  (
    import
    ./zjstatus.nix
    {zjstatus = inputs.zjstatus;}
  )
  (
    import ./anurati.nix
  )
]
