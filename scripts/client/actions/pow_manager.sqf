_actionned_captive_units = [];

while { true } do {
	_near_people = (getpos player) nearEntities [["Man"], 4];
	{
		if ( (captive _x) && !(_x in _actionned_captive_units) && !((side group _x) == WEST) ) then {
			_x addAction ["<t color='#FFFF00'>" + localize "STR_SECONDARY_CAPTURE" + "</t>","scripts\client\actions\do_capture.sqf","",-850,true,true,"","(vehicle player == player) && (side group _target != WEST) && (captive _target)"];
			_actionned_captive_units = _actionned_captive_units + [_x];
		};
	} foreach _near_people;

	{
		if ( !(alive _x) || ((player distance _x) > 5) || ((side group _x) == WEST) ) then {
			removeAllActions _x;
			_actionned_captive_units = _actionned_captive_units - [_x];
		};
	} foreach _actionned_captive_units;
	sleep 3;
};