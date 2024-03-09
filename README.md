# nixcfg

My nix config

## Impermanence

Start from LiveCD installer environment. Close the installer and open a terminal.

Clone and navigate to this repo.
```
cd ~
git clone https://github.com/krscott/nixcfg.git
cd nixcfg
```

Use `lsblk` to find your device.

Replace `/dev/vda` with your drive:
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/include/disko.nix --arg device '"/dev/vda"'
```

Generate the system's new nix config
```
sudo nixos-generate-config --no-filesystems --root /mnt
```

Create a new host by duplicating `hosts/nixos-vm`, and edit as needed.
Be sure to move over the newly generated `hardware-configuration.nix`.
Add a config entry in `flake.nix`.

Copy config to persistant storage.
```
sudo cp -r . /mnt/persist
```

Install NixOS. Replace `hostname` with the new entry in `flake.nix`.
```
sudo nixos-install --root /mnt --flake .#hostname
```

Reboot
```
sudo reboot
```
