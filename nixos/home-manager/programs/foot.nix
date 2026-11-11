let
	catppuccin = fetchFromGithub(
	owner = "catppucin";
	repo = "foot";
	sha256 = "";
	} + "/themes/catppuccin-mocha.ini";
in
{
 programs.foot.settings = {
	main = {
	dpi-aware = "yes";
	font = "Fira Code:size=11";
	term = "xterm256-color";
	include = "${catppuccin}";
	};
	mouse = {
	hide-when-typing = "yes";
	};
 };

}
