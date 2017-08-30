import flash.ui.Keyboard;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.events.Event;
import flash.events.Event;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;    
import flash.ui.Mouse;
Mouse.hide();

stage.scaleMode = StageScaleMode.EXACT_FIT;
var formatLargeText:TextFormat = new TextFormat();
formatLargeText.size = 65;
formatLargeText.font = "Bebas Neue";
var formatKillsText:TextFormat = new TextFormat();
//gameOver.setTextFormat(formatLargeText);

//SOUNDS
var pistol1:pistol;
var sfxSoundChannel:SoundChannel;
pistol1 = new pistol();

var heat:Number = 0;
var shotStay:Number = 1;
var dischargeCount:Number = 0;
var botNum:Number = 0;
var xEntry:Number = 1;
var xPlacement:Number = 1;
var xAgility:Number = 4;
var deadLegs:Number = 200;
var playerSize:Number = 25;
var findingTarget:Number = 0;
var closest = 0;
var closest2 = 0;
var closest3 = 0;
var closest4 = 0;
var closest5 = 0;
var closest2old = 0;
var diag:int; 
var botTimer:Number = 20;
var botsKilled:Number = 0;
var restarts:Number = 0;
var clearing:Number = 0;
var xX:Number = 0;
var xY:Number = 0;
var xRotation:Number = 0;
var highestBody:Number = 1;
var bloodSpray:Number = 1;
var weaponDrop:Number = 50;
var gameSpeed = 1.2;
var gameplay = 1;
  
var zoom:Number = 1.5;

player1.width /= zoom;
player1.height /= zoom;
legs.width /= zoom;
legs.height /= zoom;


player1.x = 575;
player1.y = 325;
player1.alive = 1;
player1.shot.alpha = 0;
player1.shot2.alpha = 0;
player1.shotSG1.alpha = 0;

player1.sup = 0;
player1.sright = 0;
player1.sdown = 0;
player1.sleft = 0;
player1.kup = 0;
player1.kright = 0;
player1.kdown = 0;
player1.kleft = 0;
player1.weapon = "P";
player1.dp = 0;
player1.sg = 0;
player1.mg = 0;
player1.player1sg.visible = false;
player1.aiming = 0;

//gameOver.x = 575-gameOver.width/2;
gameOver.x = -18.1;
legs.visible = false;
gameOver.visible = false;
player1.shot.height *= zoom;
player1.shot.width *= zoom;
player1.shot2.height *= zoom;
player1.shot2.width *= zoom;

hud1.pAmmo1.alpha = 1;
hud1.mgAmmo1.alpha = 0;
hud1.sgAmmo1.alpha = 0;
hud1.ammo.alpha = 0;
hud1.ammo.text = "";

//declarations

function discharge(){
if (player1.alive == 1 && gameplay == 1){
sfxSoundChannel = pistol1.play();
findingTarget = 1;
player1.shot.alpha = 1;
if (player1.weapon == "MG"){heat = 3; player1.mg -= 1;}
else if (player1.weapon == "SG"){heat = 9; player1.sg -= 1;  player1.shot.alpha = 0;  player1.shotSG1.alpha = 1;}
else if (player1.weapon == "DP"){findingTarget = 2; player1.shot2.alpha = 1; heat = 9; player1.dp -= 1;}
else {player1.weapon = "P";}
if (player1.weapon == "P"){heat = 9;}
shotStay = 2;

dischargeCount+=1;
if (player1.sup == 1){closest = -1650; closest2 = -1650; closest3 = -1650; closest4 = -1650; closest5 = -1650;}
if (player1.sdown == 1){closest = 1650; closest2 = 1650; closest3 = 1650; closest4 = 1650; closest5 = 1650;}
if (player1.sleft == 1){closest = -1650; closest2 = -1650; closest3 = -1650; closest4 = -1650; closest5 = -1650;}
if (player1.sright == 1){closest = 1650; closest2old = 1650; closest2 = 1650; closest3 = 1650; closest4 = 1650; closest5 = 1650;}
//diags
if (player1.sup == 1 && player1.sright == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sdown == 1 && player1.sright == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sdown == 1 && player1.sleft == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sup == 1 && player1.sleft == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}

}//end player1 == alive
}//end discharge

function createBot(){
var newBot:bot = new bot();
addChild(newBot);
newBot.botBody2.alpha = 0;
newBot.botBody3.alpha = 0;
newBot.botBody4.alpha = 0;
newBot.addEventListener(Event.ENTER_FRAME, botFrame);
newBot.width /= zoom;
newBot.height /= zoom;
botNum+=1;
newBot.alive = 1;
newBot.killme = 0;
newBot.number = botNum;
newBot.agility = Math.floor(Math.random() * (1+5-3)) + 3;
newBot.quick = Math.floor(Math.random() * (1+10-1)) + 1;
if (botNum > 150 && newBot.quick == 1){newBot.agility = 8; newBot.botBody2.alpha = 1; newBot.botBody.alpha = 0;}
if (newBot.agility == 3){ newBot.botBody3.alpha = 1; newBot.botBody.alpha = 0;}
if (newBot.agility == 5){ newBot.botBody4.alpha = 1; newBot.botBody.alpha = 0;}
newBot.shotAngle = "up";
newBot.tate = 0;
newBot.rotation =
newBot.entry = xEntry;
xEntry = 1;
if (xEntry == 1){newBot.rotation = 180; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 0;}
if (xEntry == 2){newBot.rotation =270; newBot.x = 1150; newBot.y = Math.floor(Math.random() * (1+630-450)) + 450;}
if (xEntry == 3){newBot.rotation = 0; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 650;}
if (xEntry == 4){newBot.rotation = 90; newBot.x = 0; newBot.y = Math.floor(Math.random() * (1+630-450)) + 450;}

}

function botFrame(e:Event):void{
if (gameplay == 0){
e.target.botLegs.stop();
e.target.stop();
}
if (gameplay == 1){
e.target.play();
e.target.botLegs.play();
//kill bot
if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
removeChild(MovieClip(e.target));
}


if (e.target.killme == 1 && player1.weapon == "SG"){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (e.target.y - e.target.x == closest){closest = 0;}
		if (e.target.y - e.target.x == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
}
else{

if (e.target.killme == 1 && player1.alive == 1 && (e.target.x == closest || (e.target.x == closest2 && player1.weapon == "DP")) && (e.target.shotAngle == "left" || e.target.shotAngle == "right")){
if (e.target.x == closest){closest = 0;}
if (e.target.x == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		e.target.alive = 0;
		findingTarget -= 1;
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
	}
	if (e.target.killme == 1 && player1.alive == 1 && (e.target.y == closest || (e.target.y == closest2 && player1.weapon == "DP")) && (e.target.shotAngle == "up" || e.target.shotAngle == "down")){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (e.target.y == closest){closest = 0;}
		if (e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
	}
	//diags
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "upleft" && (-e.target.x - e.target.y == closest || (-e.target.x - e.target.y == closest2 && player1.weapon == "DP"))){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (-e.target.x - e.target.y == closest){closest = 0;}
		if (-e.target.x - e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "upright" && e.target.x - e.target.y == closest || ((e.target.dist1 == closest || e.target.dist1 == closest2) && player1.weapon == "DP")){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (e.target.dist1 == closest){closest = 0;}
		if (e.target.dist1 == closest2){closest2 = 0;}
 		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "downright" && (e.target.x + e.target.y == closest || (e.target.x + e.target.y == closest2 && player1.weapon == "DP"))){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (e.target.x + e.target.y == closest){closest = 0;}
		if (e.target.x + e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "downleft" && (e.target.y - e.target.x == closest || (e.target.y - e.target.x == closest2 && player1.weapon == "DP"))){
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));
		e.target.alive = 0;
		if (e.target.y - e.target.x == closest){closest = 0;}
		if (e.target.y - e.target.x == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
		botsKilled += 1;
	}

}//end else not shotgun

//bot movement
if (e.target.alive == 1){
e.target.dx1 = e.target.x-player1.x;
e.target.dy1 = e.target.y-player1.y;
e.target.distSQ1 = e.target.dx1*e.target.dx1 + e.target.dy1*e.target.dy1;
e.target.dist1 = Math.sqrt(e.target.distSQ1);
e.target.ax1 = e.target.agility*e.target.dx1/e.target.dist1;
e.target.ay1 = e.target.agility*e.target.dy1/e.target.dist1;
e.target.x -= e.target.ax1 / zoom * gameSpeed;
e.target.y -= e.target.ay1 / zoom * gameSpeed;
}
//bot rotation
e.target.rotation = Math.atan2(e.target.dy1,e.target.dx1)/(Math.PI/180) + 270; e.target.tate = 10;
e.target.tate-=1;
//killing player1 detection kill player
if (e.target.alive == 1 && e.target.x < player1.x + playerSize/2 - 20 + 25 && e.target.x > player1.x - playerSize/2 - 25 + 20 && e.target.y < player1.y + playerSize/2 + 25 - 20 && e.target.y > player1.y - playerSize/2 - 25 + 20){
player1.alive = 0;
}
	
//killmes
if (findingTarget > 0 && e.target.alive == 1){
	
if (player1.weapon == "P" || player1.weapon == "MG"){
	if (player1.sup == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y < player1.y && e.target.x < player1.x + playerSize/2 + 15 && e.target.x > player1.x - playerSize/2 - 10){
		if (e.target.y > closest){closest2 = closest; closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";}
	}
	if (player1.sdown == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y > player1.y && e.target.x < player1.x + playerSize/2 + 15 && e.target.x > player1.x - playerSize/2 - 10){
		if (e.target.y < closest){closest2 = closest; closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "down";}
	}
	if (player1.sleft == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x < player1.x && e.target.y < player1.y + playerSize/2 + 15 && e.target.y > player1.y - playerSize/2 - 10){
		if (e.target.x > closest){closest2 = closest; closest = e.target.x; e.target.killme = 1; e.target.shotAngle = "left";}
	}
	if (player1.sright == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x > player1.x && e.target.y < player1.y + playerSize/2 + 15 && e.target.y > player1.y - playerSize/2 - 10){
		if (e.target.x < closest){closest2 = closest; closest = e.target.x; e.target.killme = 1; e.target.shotAngle = "right";}
	}
	//diags
if ((player1.sup == 1 && player1.sright == 1) || (player1.sup == 1 && player1.sleft == 1) || (player1.sdown == 1 && player1.sright == 1) || (player1.sdown == 1 && player1.sleft == 1)){
for (diag = 0; diag < 1650;){
	diag+=5;
	if (player1.sup == 1 && player1.sright == 1 && player1.x + diag < e.target.x + 20 && player1.x + diag > e.target.x - 20 && player1.y - diag < e.target.y + 20 && player1.y - diag > e.target.y - 20){
	if (e.target.x - e.target.y < closest){closest2 = closest; closest = e.target.x - e.target.y; e.target.killme = 1; e.target.shotAngle = "upright";}
	}
	if (player1.sdown == 1 && player1.sright == 1 && player1.x + diag < e.target.x + 20 && player1.x + diag > e.target.x - 20 && player1.y + diag < e.target.y + 20 && player1.y + diag > e.target.y - 20){
	if (e.target.x + e.target.y < closest){closest2 = closest; closest = e.target.x + e.target.y; e.target.killme = 1; e.target.shotAngle = "downright";}
	}
	if (player1.sdown == 1 && player1.sleft == 1 && player1.x - diag < e.target.x + 20 && player1.x - diag > e.target.x - 20 && player1.y + diag < e.target.y + 20 && player1.y + diag > e.target.y - 20){
	if (e.target.y - e.target.x < closest){closest2 = closest; closest = e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "downleft";}
	}
	if (player1.sup == 1 && player1.sleft == 1 && player1.x - diag < e.target.x + 20 && player1.x - diag > e.target.x - 20 && player1.y - diag < e.target.y + 20 && player1.y - diag > e.target.y - 20){
	if (-e.target.x - e.target.y < closest){closest2 = closest; closest = -e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "upleft";}
	}
}//end for loop
}//end detecting if player is shooting diagonally
}//end P, MG condition

if (player1.weapon == "DP"){
	if (player1.sup == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y < player1.y && e.target.x < player1.x + playerSize/2 + 25 && e.target.x > player1.x - playerSize/2 - 25){
		if (e.target.y > closest2){closest2 = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";}
		if (e.target.y > closest){closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";} 
	}
	if (player1.sdown == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y > player1.y && e.target.x < player1.x + playerSize/2 + 25 && e.target.x > player1.x - playerSize/2 - 25 ){
		if (e.target.y < closest2){closest2 = e.target.y; e.target.killme = 1; e.target.shotAngle = "down";}
		if (e.target.y < closest){closest2 = closest; closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "down";}
	}
	if (player1.sleft == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x < player1.x && e.target.y < player1.y + playerSize/2 + 25 && e.target.y > player1.y - playerSize/2 - 25){
		if (e.target.x > closest2){closest2 = e.target.x; e.target.killme = 1; e.target.shotAngle = "left";}
		if (e.target.x > closest){closest2 = closest; closest = e.target.x; e.target.killme = 1; e.target.shotAngle = "left";}
	}
	if (player1.sright == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x > player1.x && e.target.y < player1.y + playerSize/2 + 25 && e.target.y > player1.y - playerSize/2 - 25){
		if (e.target.x < closest2){closest2 = e.target.x; e.target.killme = 1; e.target.shotAngle = "right";}
		if (e.target.x < closest){closest2 = closest; closest = e.target.x; e.target.killme = 1; e.target.shotAngle = "right";}
 }
	//diags
if ((player1.sup == 1 && player1.sright == 1) || (player1.sup == 1 && player1.sleft == 1) || (player1.sdown == 1 && player1.sright == 1) || (player1.sdown == 1 && player1.sleft == 1)){
for (diag = 0; diag < 1650;){
	diag+=5;
	if (player1.sup == 1 && player1.sleft == 1 && player1.x - diag < e.target.x + 30 && player1.x - diag > e.target.x - 30 && player1.y - diag < e.target.y + 30 && player1.y - diag > e.target.y - 30){
	if (-e.target.x - e.target.y < closest2){closest2 = -e.target.x - e.target.y; e.target.killme = 1; e.target.shotAngle = "upleft";}
	if (-e.target.x - e.target.y < closest){closest2 = closest; closest = -e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "upleft";}
	}
	if (player1.sup == 1 && player1.sright == 1 && player1.x + diag < e.target.x + 30 && player1.x + diag > e.target.x - 30 && player1.y - diag < e.target.y + 30 && player1.y - diag > e.target.y - 30){
	if (e.target.dist1 < closest2){closest2old = closest2; closest2 = e.target.dist1; e.target.killme = 1; e.target.shotAngle = "upright";}
	if (e.target.dist1 < closest){closest2 = closest; closest = e.target.dist1; e.target.killme = 1; e.target.shotAngle = "upright";}
	if (closest == closest2){closest2 = closest2old;}

	}
	if (player1.sdown == 1 && player1.sright == 1 && player1.x + diag < e.target.x + 30 && player1.x + diag > e.target.x - 30 && player1.y + diag < e.target.y + 30 && player1.y + diag > e.target.y - 30){
	if (e.target.x + e.target.y < closest2){closest2old = closest2; closest2 = e.target.x + e.target.y; e.target.killme = 1; e.target.shotAngle = "downright";}
	if (e.target.x + e.target.y < closest){closest2 = closest; closest = e.target.x + e.target.y; e.target.killme = 1; e.target.shotAngle = "downright";}
	if (closest == closest2){closest2 = closest2old;}
	}
	if (player1.sdown == 1 && player1.sleft == 1 && player1.x - diag < e.target.x + 30 && player1.x - diag > e.target.x - 30 && player1.y + diag < e.target.y + 30 && player1.y + diag > e.target.y - 30){
	if (-e.target.x + e.target.y < closest2){closest2 = e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "downleft";}
	if (-e.target.x + e.target.y < closest){closest2 = closest; closest = e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "downleft";}
	}
}//end for loop
}//end detecting if player is shooting diagonally
}//end DP condition
if (player1.weapon == "SG"){
		if (player1.sup == 1 && player1.sleft == 0 && player1.sright == 0 && ((e.target.rotation > 135 && e.target.rotation < 180) || (e.target.rotation > -180 && e.target.rotation < -135)) && e.target.dist1 < 300){
		if (e.target.y > closest2){closest2 = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";}
		if (e.target.y > closest){closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";} 
		e.target.killme = 1;

}
//((e.target.rotation > -45 && e.target.rotation < 0) || (e.target.rotation > 0 && e.target.rotation < 45))
}// SG condition



}// end findingTarget > 0

if (e.target.number == 1){label1.text = String(e.target.rotation);}

} // end gameplay condition
}//end botFrame

function createDead(){
var newDead:dead = new dead();
addChildAt(newDead,highestBody);
highestBody += 1;
newDead.addEventListener(Event.ENTER_FRAME, deadFrame);
newDead.timer = 100;
if (player1.weapon == "P"){newDead.force = 15 / zoom;}
if (player1.weapon == "DP"){newDead.force = 22 / zoom;}
if (player1.weapon == "MG"){newDead.force = 20 / zoom;}
if (player1.weapon == "SG"){newDead.force = 30 / zoom;}
newDead.x = xX;
newDead.y = xY;
newDead.rotation = xRotation;


}//end createDead

function deadFrame(e:Event):void{
if (gameplay == 1){
if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, deadFrame);
removeChild(MovieClip(e.target));
}

e.target.timer -=1;
if (e.target.force > 0){e.target.deadMan1.y+=e.target.force; e.target.force -= 2;}
if (e.target.timer < 0){
e.target.alpha -= .05;
}
if (e.target.alpha <= 0){
		e.target.removeEventListener(Event.ENTER_FRAME, deadFrame);
		removeChild(MovieClip(e.target));
		highestBody -= 1;
}
}// end gameplay condition
}//end deadFrame

function createBlood(){
var newBlood:blood = new blood();
addChild(newBlood);
newBlood.addEventListener(Event.ENTER_FRAME, bloodFrame);
newBlood.x = xX;
newBlood.alpha = 1.5;
newBlood.y = xY;
newBlood.height = 6 / zoom;
newBlood.width = 6 / zoom;
}//end createBlood

function bloodFrame(e:Event):void{
if (gameplay == 1){

if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, bloodFrame);
removeChild(MovieClip(e.target));
}
e.target.alpha -= .2;
e.target.width += 12;
e.target.height += 12;
if (e.target.alpha <= 0){
		e.target.removeEventListener(Event.ENTER_FRAME, bloodFrame);
		removeChild(MovieClip(e.target));
}
} // end gameplay cond
}//end bloodFrame

function createDoublePistols(){
var newDoublePistols:doublePistols = new doublePistols();
addChild(newDoublePistols);
newDoublePistols.addEventListener(Event.ENTER_FRAME, doublePistolsFrame);
newDoublePistols.x = xX;
newDoublePistols.y = xY;
newDoublePistols.alpha = 4;
newDoublePistols.got = 0;

}//end createDoublePistols

function doublePistolsFrame(e:Event):void{
if (gameplay == 1){

if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, doublePistolsFrame);
removeChild(MovieClip(e.target));
}
if (e.target.got == 0){e.target.alpha -= .003;}
if (e.target.got == 1){e.target.alpha -= .2; e.target.width += 5; e.target.height += 5;}
if (e.target.alpha <= 0){
		e.target.removeEventListener(Event.ENTER_FRAME, doublePistolsFrame);
		removeChild(MovieClip(e.target));
}
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2) && (player1.x + playerSize/2 > e.target.x - e.target.width/2) && (player1.y - playerSize/2 < e.target.y + e.target.height/2) && (player1.y + playerSize/2 > e.target.y - e.target.height/2)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "DP";
		player1.dp += 40;
}
}//gameplay
}//end doublePistolsFrame

function createMachinegun(){
var newMachinegun:machinegun = new machinegun();
addChild(newMachinegun);
newMachinegun.addEventListener(Event.ENTER_FRAME, machinegunFrame);
newMachinegun.x = xX;
newMachinegun.y = xY;
newMachinegun.alpha = 4;
newMachinegun.got = 0;
}//end createMachinegun

function machinegunFrame(e:Event):void{
if (gameplay == 1){

if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, machinegunFrame);
removeChild(MovieClip(e.target));
}
if (e.target.got == 0){e.target.alpha -= .003;}
if (e.target.got == 1){e.target.alpha -= .2; e.target.width += 5; e.target.height += 5;}
if (e.target.alpha <= 0){
		e.target.removeEventListener(Event.ENTER_FRAME, machinegunFrame);
		removeChild(MovieClip(e.target));
}
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2) && (player1.x + playerSize/2 > e.target.x - e.target.width/2) && (player1.y - playerSize/2 < e.target.y + e.target.height/2) && (player1.y + playerSize/2 > e.target.y - e.target.height/2)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "MG";
		player1.mg += 60;
		player1.player1p.visible = false;
		player1.player1sg.visible = true;
}
} // gameplay
}//end machinegunFrame

function createShotgun(){
var newShotgun:shotgun = new shotgun();
addChild(newShotgun);
newShotgun.addEventListener(Event.ENTER_FRAME, shotgunFrame);
newShotgun.x = xX;
newShotgun.y = xY;
newShotgun.alpha = 4;
newShotgun.got = 0;
}//end createShotgun

function shotgunFrame(e:Event):void{
if (gameplay == 1){
if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, shotgunFrame);
removeChild(MovieClip(e.target));
}
if (e.target.got == 0){e.target.alpha -= .003;}
if (e.target.got == 1){e.target.alpha -= .2; e.target.width += 5; e.target.height += 5;}
if (e.target.alpha <= 0){
		e.target.removeEventListener(Event.ENTER_FRAME, shotgunFrame);
		removeChild(MovieClip(e.target));
}
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2) && (player1.x + playerSize/2 > e.target.x - e.target.width/2) && (player1.y - playerSize/2 < e.target.y + e.target.height/2) && (player1.y + playerSize/2 > e.target.y - e.target.height/2)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "SG";
		player1.sg += 36;
}
}//gameplay con
}//end shotgunFrame




//timer1 teimr1 tiemer1 tiemr1
addEventListener(Event.ENTER_FRAME, fl_EnterFrameHandler);
function fl_EnterFrameHandler(event:Event):void{
if (gameplay == 0){
legs.stop();
}

if (gameplay == 1){
legs.play();
hud1.ammo.x = -363.1;
hud1.ammo.x = -459;

if (player1.weapon == "P"){hud1.pBig1.alpha = .6;} else {hud1.pBig1.alpha = 0;}
if (player1.weapon == "DP"){hud1.dpBig1.alpha = .6;} else {hud1.dpBig1.alpha = 0;}
if (player1.weapon == "MG"){hud1.mgBig1.alpha = .6; kills.y = 82} else {hud1.mgBig1.alpha = 0; kills.y = 111.35}
if (player1.weapon == "SG"){hud1.sgBig1.alpha = .6;} else {hud1.sgBig1.alpha = 0;}

if (player1.weapon == "DP"){hud1.pAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.dp); hud1.ammo.x = -363.1;} else {hud1.pAmmo1.alpha = 0;}
if (player1.weapon == "MG"){hud1.mgAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.mg); hud1.ammo.x = -459;} else {hud1.mgAmmo1.alpha = 0;}
if (player1.weapon == "SG"){hud1.sgAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.sg); hud1.ammo.x = -459;} else {hud1.sgAmmo1.alpha = 0;}
if (player1.weapon == "P"){hud1.ammo.alpha = 0 ;hud1.ammo.x = -363.1;}

if (player1.weapon == "DP" && player1.dp <= 0){player1.weapon = "P";}
if (player1.weapon == "MG" && player1.mg <= 0){player1.weapon = "P";}
if (player1.weapon == "SG" && player1.sg <= 0){player1.weapon = "P";}

kills.text = String(botsKilled);
formatKillsText.size = (botsKilled/ 5) + 15;
kills.setTextFormat(formatKillsText);
if (player1.x > 850 && player1.y < 200){kills.alpha = .4; hud1.alpha = .4;} else {kills.alpha = 1; hud1.alpha = 1;}

if (player1.weapon == "DP"){player1.shot.x = 9;	player1.shot2.x = -9; player1.player1p.visible = false; player1.player1sg.visible = false; player1.player1dp.visible = true;}
if (player1.weapon == "P"){player1.shot.y = -24.5;player1.shot.x = 0; player1.player1p.visible = true; player1.player1sg.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "MG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "SG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}

if (player1.aiming > 0){player1.aiming -= 1;}
if (player1.aiming <= 0){
if (player1.kup == 1 && player1.kright == 0 && player1.kleft == 0){player1.rotation = 0;}
if (player1.kdown == 1 && player1.kright == 0 && player1.kleft == 0){player1.rotation = 180;}
if (player1.kright == 1 && player1.kup == 0 && player1.kdown == 0){player1.rotation = 90;}
if (player1.kleft == 1 && player1.kup == 0 && player1.kdown == 0){player1.rotation = 270;}
if (player1.kright == 1 && player1.kup == 1){player1.rotation = 45;}
if (player1.kright == 1 && player1.kdown == 1){player1.rotation = 135;}
if (player1.kleft == 1 && player1.kdown == 1){player1.rotation = 225;}
if (player1.kleft == 1 && player1.kup == 1){player1.rotation = 315;}
}

if (player1.weapon == "MG"){player1.shot.x = (Math.floor(Math.random() * (1+8-1)) + 1)-4;}
	
//weapondrops weapon drop weapon spawn
if (weaponDrop > 0){weaponDrop-=1;}
if (weaponDrop <= 0){
xX = Math.floor(Math.random() * (1+1050-100)) + 100;
xY = Math.floor(Math.random() * (1+550-150)) + 150;
weaponDrop = Math.floor(Math.random() * (1+700-20)) + 10;
xAgility = Math.floor(Math.random() * (1+3-3)) + 3;
if (xAgility == 1){createMachinegun();}
if (xAgility == 2){createDoublePistols();}
if (xAgility == 3){createShotgun();}
}

if (player1.alive == 0){
bloodSpray -= 1;
if (bloodSpray <= 0){
xX = player1.x - 15 + Math.floor(Math.random() * (1+20-1)) + 1;
xY = player1.y - 15 + Math.floor(Math.random() * (1+20-1)) + 1;
createBlood();
bloodSpray = 5;
}

}


if (clearing>0){clearing-=1; player1.alive = 1;}
botTimer-=1;
if (botTimer <= 0 && ((player1.alive == 1 && botNum - botsKilled < 100) || (player1.alive == 0 && botNum - botsKilled < 70))){
botTimer = 10-(botsKilled/110);
xEntry = Math.floor(Math.random() * (1+4-1)) + 1;
xPlacement = Math.floor(Math.random() * (1+1000-1)) + 1;
createBot();
}
shotStay -= 1;
if (shotStay <= 0){
	player1.shotSG1.alpha = 0;
	player1.shot2.alpha = 0;
	player1.shot.alpha = 0;
	//findingTarget -= 1;
}

if (heat == 0 && (player1.sup == 1 || player1.sright == 1 || player1.sdown == 1 || player1.sleft == 1)){
discharge();
}
if (heat > 0){heat -= 1;}
		
//player movement
if (player1.alive == 1){
if (player1.kup == 1 && player1.y > 0){
	player1.y -= 8 / zoom * gameSpeed;
	legs.rotation = 0;
}
if (player1.kdown == 1 && player1.y < 650){
	player1.y += 8 / zoom * gameSpeed;
	legs.rotation = 180;
}
if (player1.kleft == 1 && player1.x > 0){
	player1.x -= 8 / zoom * gameSpeed;
	legs.rotation = 270;
}
if (player1.kright == 1 && player1.x < 1150){
	player1.x += 8 / zoom * gameSpeed;
	legs.rotation = 90;
}
//diags
if (player1.kup == 1 && player1.kright == 1){
	legs.rotation = 45;
}
if (player1.kdown == 1 && player1.kright == 1){
	legs.rotation = 135;
}
if (player1.kdown == 1 && player1.kleft == 1){
	legs.rotation = 180+45;
}
if (player1.kup == 1 && player1.kleft == 1){
	legs.rotation = 270+45;
}
legs.x = player1.x;
legs.y = player1.y;
if (player1.kup == 0 && player1.kdown == 0 && player1.kright == 0 && player1.kleft == 0){
	legs.visible = false;
}else {legs.visible = true;}

if (player1.sup == 1){
	player1.rotation = 0;
}
if (player1.sdown == 1){
	player1.rotation = 180;
}
if (player1.sleft == 1){
	player1.rotation = 270;
}
if (player1.sright == 1){
	player1.rotation = 90;
}
//diags
if (player1.sup == 1 && player1.sright == 1){
	player1.rotation = 45;
}
if (player1.sdown == 1 && player1.sright == 1){
	player1.rotation = 135;
}
if (player1.sdown == 1 && player1.sleft == 1){
	player1.rotation = 180+45;
}
if (player1.sup == 1 && player1.sleft == 1){
	player1.rotation = 270+45;
}
}
if (player1.alive == 0){deadLegs-=1;}
if (deadLegs < 1){legs.stop();}
if (player1.alive == 0){

	gameOver.text = String("you killed " + botsKilled + "\n" + " press [space] to restart");
	setChildIndex(gameOver,numChildren-1);
	formatKillsText.size += 10;
	gameOver.setTextFormat(formatKillsText);
	gameOver.visible = true;
	hud1.alpha = 0;
	kills.alpha = 0;
	
}
}// end gameplay condition

}//end timer1 end sub

stage.addEventListener(KeyboardEvent.KEY_DOWN, fl_KeyboardDownHandler);
function fl_KeyboardDownHandler(event:KeyboardEvent):void
{
	
	if (event.keyCode == Keyboard.UP){	
	if (player1.sup==0){
		player1.sup = 1;
		player1.aiming = 15;
		discharge();
	}
	}
	if (event.keyCode == Keyboard.LEFT){
	if (player1.sleft==0){
		player1.sleft = 1;
		player1.aiming = 15;
		discharge();
	}
	}
	if (event.keyCode == Keyboard.RIGHT){	
	if (player1.sright==0){
		player1.sright = 1;
		player1.aiming = 15;
		discharge();
	}
	}
	if (event.keyCode == Keyboard.DOWN){	
	if (player1.sdown==0){
		player1.sdown = 1;
		player1.aiming = 15;
		discharge();
	}
	}

	if (event.keyCode == Keyboard.W){	
		if (player1.alive == 1){player1.kup = 1;}
	}
	if (event.keyCode == Keyboard.A){
		if (player1.alive == 1){player1.kleft = 1;}
	}
	if (event.keyCode == Keyboard.D){	
		if (player1.alive == 1){player1.kright = 1;}
	}
	if (event.keyCode == Keyboard.S){	

		if (player1.alive == 1){player1.kdown = 1;}
	}
	if (event.keyCode == Keyboard.SPACE){	
	if (gameplay == 1 && player1.alive == 1){gameplay = 0;} else {gameplay = 1;}
	//restart
	if (player1.alive == 0){
	hud1.alpha = 1;
	kills.alpha = 1;
	botNum = 0;
	botsKilled = 0;
	player1.alive = 1;
	player1.x = 575;
	player1.y = 300;
	player1.alpha = 1;
	legs.play();
	restarts+=1;
	clearing = 4;
	deadLegs = 200;
	gameOver.visible = false;
	highestBody = 1;
	player1.weapon = "P";
	player1.dp = 0;
	player1.sg = 0;
	player1.mg = 0;
	player1.player1sg.visible = false;
	player1.player1p.visible = true;
	weaponDrop = 50;
	}
	}
	if (event.keyCode == 49){	
	player1.weapon = "P";
	}
	if (event.keyCode == 50){	
	if (player1.dp > 0) {player1.weapon = "DP";}
	}
	if (event.keyCode == 51){	
	if (player1.dp > 0) {player1.weapon = "MG";}
	}
	if (event.keyCode == 52){	
	if (player1.dp > 0) {player1.weapon = "SG";}
	}

}//end keydown Handler

stage.addEventListener(KeyboardEvent.KEY_UP, fl_KeyboardUpHandler);
function fl_KeyboardUpHandler(event:KeyboardEvent):void
{
	if (event.keyCode == Keyboard.UP){	
	player1.sup = 0;
	}
	if (event.keyCode == Keyboard.LEFT){
		player1.sleft = 0;
	}
	if (event.keyCode == Keyboard.RIGHT){	
		player1.sright = 0;
	}
	if (event.keyCode == Keyboard.DOWN){	
		player1.sdown = 0;
	}

	if (event.keyCode == Keyboard.W){	
		player1.kup = 0;
	}
	if (event.keyCode == Keyboard.A){
		player1.kleft = 0;
	}
	if (event.keyCode == Keyboard.D){	
		player1.kright = 0;
	}
	if (event.keyCode == Keyboard.S){	
		player1.kdown = 0;
	}


}//end keyUp Handler
