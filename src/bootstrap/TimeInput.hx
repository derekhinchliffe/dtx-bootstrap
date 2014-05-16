package bootstrap;

using Detox;
using ufront.util.TimeOfDayTools;
using Dates;

@:skipTemplating
class TimeInput extends NumberInput
{
	public function new(?min:TimeOfDay=0, ?max:TimeOfDay=86400, ?step:TimeOfDay=300, ?start:TimeOfDay=null, ?placeholder="")
	{
		super(min, max, step, start, placeholder);
		this.setAttr("type","text");
	}

	override function format(v:Float):String {
		return Std.int(v).timeToString();
	}

	override function parse(v:String):Float {
		return Date.fromString( v ).getTime() / 1000;
	}
}
