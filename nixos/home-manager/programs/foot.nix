{pkgs, ...}: let
	catppuccin = pkgs.fetchFromGitHub {
	owner = "catppuccin";
	repo = "foot";
	sha256 = "sha256-lFa5EpoLkrZcC80YDHyVOTnwYOCNybznlD80NkgVLYs=";
	rev = "99384a8";
	} + "/themes/catppuccin-mocha.ini";
in
{
 programs.foot.settings = {
	main = {
	dpi-aware = "yes";
	font = "Fira Code:size=11";
	term = "xterm-256color";
 	include = "${catppuccin}";
	};
	mouse = {
	hide-when-typing = "yes";
	};
 };

}
