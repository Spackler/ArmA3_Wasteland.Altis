// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;
_backpack = [_player, "backpack"] call getDefaultClothing;

//Remove all gear
removeUniform player;
removeVest player;
removeHeadgear player;
removeGoggles player;
removeBackpackGlobal player;



if (_uniform != "") then { _player forceAddUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

if (_backpack != "") then { _player addBackpack _backpack };
sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove radio
_player unlinkItem "ItemRadio";

// Add GPS
_player linkItem "ItemGPS";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
 _player linkItem "NVGoggles";	
 
 // Loadouts here
_this call classes;

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
