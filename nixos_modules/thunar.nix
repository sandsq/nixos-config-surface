{
  lib,
  pkgs,
  config,
  ...
}:
with lib;
{
  options = {
    thunar = {
      enable = mkEnableOption "enable thunar and utilities";
    };
  };
  config = mkIf config.thunar.enable {
    programs.thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    programs.xfconf.enable = true;
    services.gvfs.enable = true;
    services.tumbler.enable = true;
    programs.dconf.enable = true;
  };
}
