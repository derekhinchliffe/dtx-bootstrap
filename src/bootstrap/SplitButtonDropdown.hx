package bootstrap;

import js.html.EventListener;
import bootstrap.Button;
using Detox;
using Lambda;

@:template('<div class="btn-group">
</div>')
class SplitButtonDropdown extends dtx.widget.Widget
{
	public var btn:Button;
	public var dropdownBtn:Button;
	public var menu:DropdownMenu;

	public function new(?label = " ", ?tooltip = "", ?icon = null, ?type:ButtonType, ?size:ButtonSize, ?disabled=false)
	{
		super();

		btn = new Button(label, tooltip, icon, type, size, disabled);
		dropdownBtn = new Button("", "", null, type, size, disabled);
		menu = new DropdownMenu();

		dropdownBtn.setInnerHTML("<span class='caret'></span>").addClass("dropdown-toggle");
		dropdownBtn.tooltip = "Open Dropdown";
		menu.addClass("pull-right");

		this.append(btn);
		this.append(dropdownBtn);
		this.append(menu);
		
		// Set up open / close events
		dropdownBtn.click(function (e) {
			// Add the open class...
			if (this.hasClass("open"))
			{
				this.removeClass("open");
			}
			else 
			{
				this.addClass("open");
			}
		});
	}


	// Shortcut all the properties to the button

	public var label(get,set):String;
	public var tooltip(get,set):String;
	public var icon(get,set):Icon;
	public var type(get,set):ButtonType;
	public var size(get,set):ButtonSize;
	public var disabled(get,set):Bool;

	inline function get_label() return btn.label;
	inline function get_tooltip() return btn.tooltip;
	inline function get_icon() return btn.icon;
	inline function get_type() return btn.type;
	inline function get_size() return btn.size;
	inline function get_disabled() return btn.disabled;

	inline function set_label(v) return btn.label = v;
	inline function set_tooltip(v) return btn.tooltip = v;
	inline function set_icon(v) return btn.icon = v;
	inline function set_type(v) return btn.type = dropdownBtn.type = v;
	inline function set_size(v) return btn.size = dropdownBtn.size = v;
	inline function set_disabled(v) return btn.disabled = dropdownBtn.disabled = v;

	public inline function addItem(name:String, ?href:String, ?fn:EventListener) menu.addItem(name, href, fn);
	public inline function addDivider() menu.addDivider();
	inline public function click(e) btn.click(null, e);

}