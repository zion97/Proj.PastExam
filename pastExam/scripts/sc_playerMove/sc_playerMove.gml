//플레이어 이동 스크립트
//프로젝트 과거시험
//작성자 : 이시온
//스탭 실행 스크립트

//////////////////////////////////////////////////////////////////////////////////////////

///////////
//변수설정//
///////////

//타일 충돌 감지를 위한 변수
tileId	= layer_tilemap_get_id("Tile_Colision");
bottom1	= tilemap_get_at_pixel(tileId, x, bbox_bottom);
bottom2	= tilemap_get_at_pixel(tileId, x, bbox_bottom - 16 );
top		= tilemap_get_at_pixel(tileId, x, bbox_top);
left	= tilemap_get_at_pixel(tileId, bbox_left, bbox_bottom - 16 );
right	= tilemap_get_at_pixel(tileId, bbox_right, bbox_bottom - 16 );


///////////////
//중력 및 점프//
///////////////

//밟고있는 타일에 따라 isJump값 지정
if ( ( bottom1 == 2 && bottom2 != 2 ) || bottom1 == 3 ) isJump = false;
else isJump = true;

if ( !isJump && ySpeed > 0 ) {
	ySpeed = 0;
	if ( bbox_bottom % 64 > 0 ) y -= bbox_bottom % 64;
}

//3단계 타일과 플레이어 머리의 충돌
if ( top = 3 ) { if ( ySpeed < 0 ) ySpeed = 5; }

//점프
if ( keyJump ) { 
	if ( !isJump && canMove ) ySpeed = jumpSpeed;
}


//중력
if ( ySpeed > ob_game.gravmax ) ySpeed = ob_game.gravmax;
y = y + ySpeed;
ySpeed += ob_game.grav;

//점프 스프라이트
if ( isJump ) {
	if ( ySpeed < 0 ) sprite_index = sp_playerUp;
}


////////
//이동//
////////

//2,3단계 블록 위에서 이동
if ( canMove ) {
	if ( ( bottom1 == 2 && !bottom2 != 2 ) || bottom1 == 3 ) {
		//좌우 이동
		if ( keyLeft )	{
			xSpeed = -walkSpeed;
			dir = -1;
			sprite_index = sp_playerRun;
			image_xscale = dir;
		}
		if ( keyRight )	{
			xSpeed = walkSpeed;
			dir = 1;
			sprite_index = sp_playerRun;
			image_xscale = dir;
		}
		//좌우 대쉬
		if ( keyLeftDash )	{ xSpeed = -dashSpeed;	dir = -1; }
		if ( keyRightDash )	{ xSpeed = dashSpeed;	dir = 1; }
	}
	//공중에서 이동
	else {
		//좌우 이동
		if ( keyLeft && ( xSpeed > -walkSpeed ) )	{ xSpeed -= accSpeed; }
		if ( keyRight && ( xSpeed < walkSpeed ) )	{ xSpeed += accSpeed; }
	}
}

//3단계 블록과의 좌우 충돌
if ( ( left == 3 ) )		{ if ( xSpeed < 0 ) xSpeed = 0; }
if ( ( right == 3 ) )		{ if ( xSpeed > 0 ) xSpeed = 0; }

//실제 좌표 이동
x = x + xSpeed;

//이동 입력 없을시 정지
if ( !keyLeft && !keyRight ) {
	if ( !isJump ) sprite_index = sp_playerStand;
	if ( xSpeed > accSpeed )		xSpeed -= accSpeed;
	else if ( xSpeed < -accSpeed )	xSpeed += accSpeed;
	else							xSpeed = 0;
}

////////
//공격//
////////

if ( canMove ) {
	if ( keyAttack ) {
		canMove = false;
		atkProcess = 1;
	}
}

if ( atkProcess > 0 ) {
	switch ( weaponR ) {
		case 0: sc_atk0000(); break;
		case 1: break;
	}
}