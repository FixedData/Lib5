package lib5;


class Lib5
{
    public static function init()
    {
        #if flixel
        lib5.flixel.plugins.HotReloadPlugin.init();

        #if hxvlc
        lib5.flixel.video.FunkinVideoSprite.init();
        #end

        #end
    }
}