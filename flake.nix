{
  inputs = {
  nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  nixpkgs-legacy.url = "github:nixos/nixpkgs/nixos-24.05";
  nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  nil-ls.url = "github:oxalica/nix";
  home-manager.url = "github:nix-community/home-manager/release-24.11";
  home-manager.inputs.nixpkgs.follows = "nixpkgs";
  impermanence.url = "github:nix-community/impermanence";
  nur.url = "github:nix-community/NUR";
  disko.url = "github:nix-community/disko";
  disko.inputs.nixpkgs.follows = "nixpkgs";
};
  outputs = inputs @ {
    nixpkgs,
    nixpkgs-legacy,
    nixpkgs-unstable,
    nil-ls,
    disko,
    home-manager,
    impermanence,
    nur,
    ...
} : let user = "dragoon"; in {
  nixosConfigurations = (
    import ./hosts {
      inherit (nixpkgs) lib;
      inherit inputs disko nixpkgs nixpkgs-legacy nixpkgs-unstable home-manager impermanence user nur nil-ls;
    }
  );
};
}
