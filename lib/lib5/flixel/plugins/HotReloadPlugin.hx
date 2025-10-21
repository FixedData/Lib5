package lib5.flixel.plugins;

#if flixel_addons
import flixel.addons.transition.FlxTransitionableState;
#end
import flixel.FlxG;
import flixel.FlxBasic;
import flixel.util.FlxSignal;

/**
 * Plugin that allows easy state reloading
 * 
 * 
 * press F5 to reload the state
 * 
 * press F6 to reload and refresh memory
 */
@:nullSafety
class HotReloadPlugin extends FlxBasic
{
	public static var instance:Null<HotReloadPlugin> = null;
	
	public final onClear:FlxSignal = new FlxSignal();
	
	public final onClearFull:FlxSignal = new FlxSignal();
	
	public static function init()
	{
		if (instance == null) FlxG.plugins.addPlugin(instance = new HotReloadPlugin());
	}
	
	public function new()
	{
		super();
		this.visible = false;
	}
	
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.F5)
		{
			#if flixel_addons
			FlxTransitionableState.skipNextTransIn = FlxTransitionableState.skipNextTransOut = true;
			#end
			onClear.dispatch();
			
			FlxG.resetState();
		}
		
		if (FlxG.keys.justPressed.F6)
		{
			onClearFull.dispatch();
			
			#if flixel_addons
			FlxTransitionableState.skipNextTransIn = FlxTransitionableState.skipNextTransOut = true;
			#end
			
			FlxG.resetState();
		}
	}
	
	override function destroy()
	{
		onClear.removeAll();
		onClearFull.removeAll();
		super.destroy();
	}
}
