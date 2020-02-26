tileId	= layer_tilemap_get_id("Tile_Colision");
bottom1	= tilemap_get_at_pixel(tileId, x, bbox_bottom);
bottom2	= tilemap_get_at_pixel(tileId, x, bbox_bottom - 16 );
top		= tilemap_get_at_pixel(tileId, x, bbox_top);
left	= tilemap_get_at_pixel(tileId, bbox_left, bbox_bottom - 16 );
right	= tilemap_get_at_pixel(tileId, bbox_right, bbox_bottom - 16 );


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
if ( ySpeed > ob_game.gravmax ) ySpeed = ob_game.gravmax;
y = y + ySpeed;
ySpeed += ob_game.grav;