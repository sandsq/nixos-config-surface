{
  imports = [
    ./enable_cachix.nix
    ./garbage_collection.nix
  ];
  garbage_collection.enable = true;
}
