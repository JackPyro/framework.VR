murshun_sendNewSong_fnc = {
	if ((vehicle player) getVariable ['murshun_radioIsOn', false]) then {
		playMusic "";
		playMusic murshun_whatSong;

		[] spawn murshun_printSongName;
	};
};

murshun_playSongOnRadio_fnc = {
	_vehicle = _this select 0;

	if (isServer) then {
		_vehicle setVariable ["murshun_radioIsOn", true, true];
	};

	if (player in crew _vehicle) then {
		playMusic "";
		playMusic [murshun_whatSong, time - murshun_timeStarted];

		[] spawn murshun_printSongName;
	};
};

murshun_stopSongOnRadio_fnc = {
	_vehicle = _this select 0;

	if (isServer) then {
		_vehicle setVariable ["murshun_radioIsOn", false, true];
	};

	if (player in crew _vehicle) then {
		playMusic "";
	};
};

murshun_removeRadio_fnc = {
	_radio = _this select 0;

	_radio setVariable ["murshun_loudRadioIsOn", false, true];
	deleteVehicle (_radio getVariable ["murshun_hiddenRadio", nil]);
};

murshun_createRadio_fnc = {
	_radio = _this select 0;
	_hiddenRadio = "Land_FMradio_F" createVehicle [0, 0, 0];
	
	hideObjectGlobal _hiddenRadio;
	hideObject _hiddenRadio;
	_hiddenRadio allowDamage false;

	_hiddenRadio setPosATL getPosATL _radio;
	_hiddenRadio attachTo [_radio, [0, 0, 0]];
	_radio setVariable ["murshun_hiddenRadio", _hiddenRadio, true];
	
	if (_radio isKindOf "air" || _radio isKindOf "ship") then {
		[[_hiddenRadio, "loud_" + murshun_whatSong], "say3d"] call BIS_fnc_MP;
	} else {
		[[_hiddenRadio, murshun_whatSong], "say3d"] call BIS_fnc_MP;
	};
};

murshun_printSongName = {
	if ((gettext (configfile >> "CfgMusic" >> murshun_whatSong >> "name") != "")) then {
		[parseText format ["<t font='PuristaBold' shadow='2' align='right' size='1.6'>""%1""</t><br /><t shadow='2' align='right' size='1.4'>%2</t>", toUpper (gettext (configfile >> "CfgMusic" >> murshun_whatSong >> "name")), "by" + " " + (gettext (configfile >> "CfgMusic" >> murshun_whatSong >> "artist"))], true, nil, 7, 1, 0] spawn BIS_fnc_textTiles;
	};
};

KK_fnc_arrayShufflePlus = {
	private ["_arr", "_cnt"];
	
	_arr = _this select 0;
	_cnt = count _arr;
	
	for "_i" from 1 to (_this select 1) do {
		_arr pushBack (_arr deleteAt floor random _cnt);
	};
	
	_arr
};

murshun_musicRadiosArray = [];

if (isNil "murshun_whatSong") then {
	murshun_whatSong = "";
};

if (isNil "murshun_timeStarted") then {
	murshun_timeStarted = 0;
};

player addEventHandler ["Respawn", {
	playMusic "";
}];

murshun_radioInit = true;

if (isServer) then {
	waitUntil {time > 15};
	
	_musicArray = "gettext (_x >> 'tag') == 'Poddy Music'" configClasses (configFile >> "CfgMusic");
	
	if (count _musicArray == 0) exitWith {};
	
	while {true} do {
		_musicArray = [_musicArray, 4 * count _musicArray] call KK_fnc_arrayShufflePlus;
		
		{
			murshun_whatSong = _x;
			murshun_whatSong = configName murshun_whatSong;
			murshun_timeStarted = time;
			
			publicVariable "murshun_whatSong";
			publicVariable "murshun_timeStarted";
			
			_songInfo = [murshun_whatSong, "_"] call CBA_fnc_split;
			_songLength = _songInfo select 1;
			_songLength = parseNumber _songLength;
			
			[[], "murshun_sendNewSong_fnc"] call BIS_fnc_MP;
			
			{
				deleteVehicle (_x getVariable ["murshun_hiddenRadio", nil]);
				
				if (alive _x && _x getVariable ["murshun_loudRadioIsOn", false]) then {
					[_x] spawn murshun_createRadio_fnc;
				};
			} foreach murshun_musicRadiosArray;
			
			murshun_skipTrack = false;
			
			_time = time;
			waitUntil {
				time >= _time + _songLength or murshun_skipTrack
			};
			
			murshun_skipTrack = false;
		} foreach _musicArray;
	};	
};
