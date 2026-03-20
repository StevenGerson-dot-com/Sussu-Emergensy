public var BAR1:FlxSprite;
public var STRUMY:Float;
function create()
{
    BAR1 = new FlxSprite(0, -FlxG.height/2).makeGraphic(FlxG.width, FlxG.height/2, FlxColor.BLACK);
    BAR1.cameras = [camHUD];
    insert(0, BAR1);
    BAR2 = new FlxSprite(0, FlxG.height).makeGraphic(FlxG.width, FlxG.height/2, FlxColor.BLACK);
    BAR2.cameras = [camHUD];
    insert(0, BAR2);
}

function onEvent(eventEvent)
{
    if (eventEvent.event.name == "CinematicCOV")
    {
        var params:Array = eventEvent.event.params;

        var twn = params[0];
        var amnt = params[1];
        var time = params[2];
        var ui = params[3];
        var ease = params[4];
        var type = params[5];

        if (!twn) time = 0.000001;

        var easy:String = ease + (ease == 'linear' ? "" : type); 

        if (amnt != 0)
        {
            FlxTween.tween(BAR1, {y : -FlxG.height/2 + FlxG.height/2*amnt }, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
            FlxTween.tween(BAR2, {y : FlxG.height - FlxG.height/2*amnt }, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
        }
        else
        {
            FlxTween.tween(BAR1, {y : -FlxG.height/2}, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
            FlxTween.tween(BAR2, {y : FlxG.height}, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
        }

        if (ui)
        {
            for(s in strumLines) 
            {
                for(i in 0...4) 
                {
                    var n = s.members[i];
                    FlxTween.globalManager.cancelTweensOf(n);
                    if (amnt != 0)
                        FlxTween.tween(n, {y : 50 + FlxG.height/2*amnt }, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
                    else
                        FlxTween.tween(n, {y : 50}, ((Conductor.crochet / 4) / 1000) * time, {ease: Reflect.field(FlxEase, easy)});
                }
            }
        }
    }
}
