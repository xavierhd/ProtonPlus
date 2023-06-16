namespace ProtonPlus.Shared.Launchers {
    public class Bottles {
        static Models.Group[] get_groups (Models.Launcher launcher) {
            var groups = new Models.Group[2];

            groups[0] = new Models.Group ("Runners", "/runners", launcher);
            groups[0].runners = get_runners (groups[0]);

            groups[1] = new Models.Group ("DXVK", "/dxvk", launcher);
            groups[1].runners = get_dxvk_runners (groups[1]);

            return groups;
        }

        public static Models.Launcher get_launcher () {
            var directories = new string[] { "/.local/share/bottles" };

            var launcher = new Models.Launcher (
                                                "Bottles",
                                                "System",
                                                "/com/vysp3r/ProtonPlus/bottles.png",
                                                directories
            );

            if (launcher.installed) launcher.groups = get_groups (launcher);

            return launcher;
        }

        public static Models.Launcher get_flatpak_launcher () {
            var directories = new string[] { "/.var/app/com.usebottles.bottles/data/bottles" };

            var launcher = new Models.Launcher (
                                                "Bottles",
                                                "Flatpak",
                                                "/com/vysp3r/ProtonPlus/bottles.png",
                                                directories
            );

            if (launcher.installed) launcher.groups = get_groups (launcher);

            return launcher;
        }

        public static GLib.List<Models.Runner> get_runners (Models.Group group) {
            var runners = new GLib.List<Models.Runner> ();

            runners.append (new Models.Runner (group, "Proton-GE", "Steam compatibility tool for running Windows games with improvements over Valve's default Proton. Use this when you don't know what to choose.", "https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases", 1, Models.Runner.title_types.NONE));
            runners.append (new Models.Runner (group, "Wine-GE", "Compatibility tool \"Wine\" to run Windows games on Linux. Based on Valve Proton Experimental's bleeding-edge Wine, built for Lutris.Use this when you don't know what to choose.", "https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases", 1, Models.Runner.title_types.WINE_GE_BOTTLES));

            var runner1 = new Models.Runner (group, "Wine-Lutris", "Compatibility tool \"Wine\" to run Windows games on Linux. Improved by Lutris to offer better compatibility or performance in certain games.", "https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases", 0, Models.Runner.title_types.WINE_LUTRIS_BOTTLES);
            runner1.request_asset_exclude = "GE-Proton";
            runners.append (runner1);

            var runner2 = new Models.Runner (group, "Other", "", "https://api.github.com/repos/bottlesdevs/wine/releases", 0, Models.Runner.title_types.BOTTLES);
            runner2.use_name_instead_of_tag_name = true;
            runners.append (runner2);

            return runners;
        }

        public static GLib.List<Models.Runner> get_dxvk_runners (Models.Group group) {
            var runners = new GLib.List<Models.Runner> ();

            runners.append (new Models.Runner (group, "DXVK", "Vulkan based implementation of Direct3D 9, 10 and 11 for Linux/Wine.https://github.com/lutris/docs/blob/master/HowToDXVK.md", "https://api.github.com/repos/doitsujin/dxvk/releases", 0, Models.Runner.title_types.LUTRIS_DXVK));
            runners.append (new Models.Runner (group, "DXVK Async", "Vulkan based implementation of Direct3D 9, 10 and 11 for Linux/Wine with async patch by Sporif.Warning: Use only with singleplayer games!", "https://api.github.com/repos/Sporif/dxvk-async/releases", 0, Models.Runner.title_types.LUTRIS_DXVK_ASYNC_SPORIF));

            return runners;
        }
    }
}