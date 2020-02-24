// 몬스터 이동 AI 스크립트
// 프로젝트 과거시험
// 작성자 : 유연휘

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

// 좌우충돌, 플레이어와 일정거리 이하ㄷ가 되었을 시 발동.

//2단계 타일과 플레이어 바닥의 충돌
if ( bottom1 == 2 && bottom2 != 2  && ySpeed > 0 ) {
	ySpeed = 0;
	if ( bbox_bottom % 64 > 0 ) y -= bbox_bottom % 64;
}

//3단계 타일과 플레이어 바닥의 충돌
if ( bottom1 == 3 ) {
	ySpeed = 0;
	if ( bbox_bottom % 64 > 0 ) y -= bbox_bottom % 64;
}

//3단계 타일과 플레이어 머리의 충돌
if ( top = 3 ) { if ( ySpeed < 0 ) ySpeed = 5; }


//중력
/*if ( ySpeed > ob_game.gravmax ) ySpeed = ob_game.gravmax;
y = y + ySpeed;
ySpeed += ob_game.grav;*/



// 플레이어 트렉킹 코드 
TargetX = ob_player.x - x;
TargetY = ob_player.y - y;

var _targetX = sign(TargetX) * enemySpeed;
var _targetY = sign(TargetY) * enemySpeed;

if (place_meeting(x + _targetX, y, ob_game)) {
   while (!place_meeting(x+sign(_targetX), y, ob_game)) {
      x += sign(_targetX);
   }
   _targetX = 0;
}
x += _targetX;

if (place_meeting(y, y + _targetY, ob_game)) {
   while (!place_meeting(x, y + sign(_targetY), ob_game)) {
      y += sign(_targetY);
   }
   _targetX = 0;
}
y += _targetY;