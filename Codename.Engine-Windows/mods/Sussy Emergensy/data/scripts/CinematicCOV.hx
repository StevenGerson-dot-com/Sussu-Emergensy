public var FunkinSprite BAR1;
public var FunkinSprite BAR2;
function create()
{
    BAR1 = new FunkinSprite(0, 0).makeGraphic(FlxG.length, FlxG.height/2, FlxColor.BLACK);
    add(BAR1);
    BAR2 = new FunkinSprite(0, FlxG.height/2).makeGraphic(FlxG.length, FlxG.height/2, FlxColor.BLACK);
    add(BAR2);
}