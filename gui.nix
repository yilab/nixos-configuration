{ config, pkgs, ... }:

{
	environment = {
		systemPackages = with pkgs; [
				dmenu
				i3status
				i3lock
				gnome3.defaultIconTheme
		];
	};
	services = {
		xserver = {
			enable = true;
			synaptics = {
				enable = true;
				twoFingerScroll = true;
				tapButtons = true;
			};
			windowManager = {
				i3 = {
					enable = true;
				};
			};
			displayManager = {
				sessionCommands = ''
					${pkgs.networkmanagerapplet}/bin/nm-applet &
					${pkgs.pythonPackages.udiskie}/bin/udiskie -a -t -n -F &
					gpg-connect-agent /bye
					export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
				'';
				slim = {
					defaultUser = "xadet";
				};
			};
		};
	};
}
