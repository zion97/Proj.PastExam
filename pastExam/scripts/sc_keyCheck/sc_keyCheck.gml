//PC용 키 채크 스크립트
//프로젝트 과거시험
//작성자 : 이시온
//스탭 실행 스크립트

//////////////////////////////////////////////////////////////////////////////////////////

keyLeft			= false;
keyRight		= false;
keyJump			= false;

if ( keyboard_check_released(vk_left) )		{ keyLeftDash = false; }
if ( keyboard_check_released(vk_right) )	{ keyRightDash = false; }

if ( keyboard_check(vk_left) )			{ keyLeft	= true; }
if ( keyboard_check(vk_right) )			{ keyRight	= true; }
if ( keyboard_check( ord("C") ) )		{ keyJump	= true; }

if ( keyboard_check_pressed(vk_left) ) {
	if ( keyDbClick >= 0 ) {
		keyLeftDash = true;
		keyDbClick = -1;
	}
	else
		keyDbClick = 15;
}

if ( keyboard_check_pressed(vk_right) ) {
	if ( keyDbClick >= 0 ) {
		keyRightDash = true;
		keyDbClick = -1;
	}
	else
		keyDbClick = 15;
}

keyDbClick = max ( keyDbClick - 1, -1 );