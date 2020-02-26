//무기 0000번 공격 스크립트
//무기 : 도 종류

/////////////////////////////////////////////////////////
xSpeed = 0;

if ( atkProcess < 12 ) {
	atkProcess += 1;
	sprite_index = sp_atk0000_1;
}
else if ( atkProcess < 20 ) {
	atkProcess += 1;
	sprite_index = sp_atk0000_2;
	if ( dir == -1 ) {
		if ( left != 3 ) x -= 8;
	}
	if ( dir == 1 ) {
		if ( right != 3 ) x += 8;
	}
}
else if ( atkProcess < 30 ) {
	atkProcess += 1;
	sprite_index = sp_atk0000_2;
}
else {
	atkProcess = 0;
	canMove = true;
}