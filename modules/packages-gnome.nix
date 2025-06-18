{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
        ##########################
    ## 🧩 GNOME Tools & Extensions
    ##########################


  ];


}
