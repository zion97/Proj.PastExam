/// @description Insert description here
// You can write your code in this editor
sc_keyCheck();
sc_playerMove();

if(playerHP <= 0) {
	playerHP = 0;
	instance_destroy();
}