//플레이어 변수 선언 스크립트
//프로젝트 과거시험
//작성자 : 이시온
//생성 실행 스크립트

//////////////////////////////////////////////////////////////////////////////////////////

/////////////////
//키 채크용 변수//
/////////////////

keyLeft			= false;	//좌로이동
keyRight		= false;	//우로이동
keyJump			= false;	//점프
keyLeftDash		= false;	//좌로대쉬
keyRightDash	= false;	//우로대쉬
keyDbClick		= -1;		//더블클릭 채크


///////////////////
//플레이어 기본정보//
///////////////////

playerHP	= 100;
maxHP		= playerHP;
playerMP	= 50;
maxMP		= playerMP;
dir			= 1;
walkSpeed	= 6;
dashSpeed	= 9;
accSpeed	= 0.8;
jumpSpeed	= -14;


////////////////
//플레이어 변수//
////////////////

canMove		= true;				//이동 스크립트 사용 가능한지
isJump		= false;			//점프중인지
xSpeed		= 0;				//X축 스피드
ySpeed		= 0;				//Y축 스피드
sprite_index = sp_playerStand;	//스프라이트