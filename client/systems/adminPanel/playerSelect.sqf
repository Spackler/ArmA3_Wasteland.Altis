// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: playerSelect.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 20/11/2012 05:19
//	@file Args:

#define playerMenuDialog 55500
#define playerMenuPlayerList 55505
#define playerMenuSpectateButton 55506
#define playerMenuWarnMessage 55509

disableSerialization;

private ["_dialog","_playerListBox","_spectateButton","_switch","_index","_modSelect","_playerData","_target","_check","_spectating","_camadm","_rnum","_warnText","_targetUID","_playerName"];
_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	_dialog = findDisplay playerMenuDialog;
	_playerListBox = _dialog displayCtrl playerMenuPlayerList;
	_spectateButton = _dialog displayCtrl playerMenuSpectateButton;
	_warnMessage = _dialog displayCtrl playerMenuWarnMessage;

	_switch = _this select 0;
	_index = lbCurSel _playerListBox;
	_playerData = _playerListBox lbData _index;

	{
		if (str(_x) == _playerData) then {
			_target = _x;
			_check = 1;
		};
	} forEach playableUnits;

	if (_check == 0) exitWith{};

	switch (_switch) do
	{
		case 0: //Spectate
		{
			if (!isNil "_target") then
			{
				_spectating = ctrlText _spectateButton;
				if (_spectating == "Spectate") then
				{
					if (!([player] call camera_enabled)) then
					{
						[] call camera_toggle;
					};

					[player, _target] call camera_attach_to_target;
					player commandChat format ["Viewing %1.", name _target];
					_spectateButton ctrlSetText "Spectating";
				} else {
					_spectateButton ctrlSetText "Spectate";
					player commandChat format ["No Longer Viewing.", name _target];

					if ([player] call camera_enabled) then
					{
						[] call camera_toggle;
					};
				};
			};
		};
		case 1: //Warn
		{
			_warnText = ctrlText _warnMessage;
			_playerName = name player;
			[format ["Message from Admin: %1", _warnText], "A3W_fnc_titleTextMessage", _target, false] call A3W_fnc_MP;
		};
		case 2: //Slay
		{
			_target setDamage 1;
		};
		case 3: //Unlock Team Switcher
		{
			pvar_teamSwitchUnlock = getPlayerUID _target;
			publicVariableServer "pvar_teamSwitchUnlock";
		};
		case 4: //Unlock Team Killer
		{
			pvar_teamKillUnlock = getPlayerUID _target;
			publicVariableServer "pvar_teamKillUnlock";
		};
		case 5: //Remove All Money
		{
			_targetUID = getPlayerUID _target;
			{
				if(getPlayerUID _x == _targetUID) exitWith
				{
					_x setVariable["cmoney",0,true];
				};
			}forEach playableUnits;
		};
		case 6: //Remove All Items, Gear, Etc.
		{
			_targetUID = getPlayerUID _target;
			{
				if(getPlayerUID _x == _targetUID) exitWith
				{
					removeAllWeapons _x;
					removeHeadgear _x:
					removeGoggles _x;
					removeVest _x;
					removeBackpack _x;
					removeUniform _x;
					removeAllAssignedItems _x;
					_x setVariable ["cmoney", 0, true];
				};
			}forEach playableUnits;
		};
		case 7: //Burn Player
		{
			_targetUID = getPlayerUID _target;
			{
				if(getPlayerUID _x == _targetUID) exitWith
				{
					_target setDamage 0.48;
					_target setHitPointDamage ["hitBody", 0.6];
					player removeItems "FirstAidKit";
					_smoke = "SmokeShellOrange" createVehicle position player;
					_smoke attachTo [player, [-0.1, 0.1, 0.15], "Pelvis"];
					_smoke setVectorDirAndUp [ [0.5, 0.5, 0], [-0.5, 0.5, 0] ];
				};
			}forEach playableUnits;
		};
		/* case 8: //Kick Player
		{
			_targetUID = getPlayerUID _target;
			{
				if(getPlayerUID _x == _targetUID) then
				{
					preprocessFile 'client\functions\quit.sqf';
				};
			}forEach playableUnits;
		}; */
		
	};
};
