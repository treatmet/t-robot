import flash.ui.Keyboard;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.events.Event;
import flash.events.Event;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;    
import flash.ui.Mouse;
//import flash.media.soundmixer.stopAll;
Mouse.hide();

stage.scaleMode = StageScaleMode.SHOW_ALL;
//stop();

//new vars
var deadTimer:Number = 0;
var stompTimer:Number = 0;

var formatLargeText:TextFormat = new TextFormat();
formatLargeText.size = 65;
formatLargeText.font = "Bebas Neue";
var formatKillsText:TextFormat = new TextFormat();
//gameOver.setTextFormat(formatLargeText);

//SOUNDS
var sfxSoundChannel:SoundChannel;

var pistol1:pistol;
pistol1 = new pistol();
var pistol2SFX1:pistol2SFX;
pistol2SFX1 = new pistol2SFX();
var doublePistolsSFX1:doublePistolsSFX;
doublePistolsSFX1 = new doublePistolsSFX();
var perfectSFX1:perfectSFX;
perfectSFX1 = new perfectSFX();
var shotgunSFX1:shotgunSFX;
shotgunSFX1 = new shotgunSFX();
var deadSFX1:deadSFX;
deadSFX1 = new deadSFX();
var dead2SFX1:dead2SFX;
dead2SFX1 = new dead2SFX();
var pPickSFX1:pPickSFX;
pPickSFX1 = new pPickSFX();
var dpPickSFX1:dpPickSFX;
dpPickSFX1 = new dpPickSFX();
var sgPickSFX1:sgPickSFX;
sgPickSFX1 = new sgPickSFX();
var mgPickSFX1:mgPickSFX;
mgPickSFX1 = new mgPickSFX();
var p1DeadSFX1:p1DeadSFX;
p1DeadSFX1 = new p1DeadSFX();
//var music1:music;
//music1 = new music();
var dropSFX1:dropSFX;
dropSFX1 = new dropSFX();
var stompSFX1:stompSFX;
stompSFX1 = new stompSFX();
var clickSFX1:clickSFX;
clickSFX1 = new clickSFX();



var heat:Number = 0;
var shotStay:Number = 1;
var botNum:Number = 0;
var xEntry:Number = 1;
var xEntry2:Number = 1;
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
var weaponDrop:Number = Math.floor(Math.random() * (1+800-50)) + 50;
var gameSpeed:Number = 1.2;
var gameplay:Number = 1;
var gateTimer:Number = 0;
var streak:Number = 0;
var findingTargetKill:Number = 0;
var temp:Number = 0;
var mute:Number = 0;
var zoom:Number = 1.5;
var statFocus = "KILLS";
var statDir = 0;
var hold = 0;
var chain:Number = 0;
var sCombo:Number = 0;
var comboFall:Number = 0;


//stats
var sPistolKills:Number = 0;
var sDoublePistolKills:Number = 0;
var sMachinegunKills:Number = 0;
var sShotgunKills:Number = 0;
var sPistolDischarges:Number = 0;
var sDoublePistolDischarges:Number = 0;
var sMachinegunDischarges:Number = 0;
var sShotgunDischarges:Number = 0;
var dischargeCount:Number = 0;
var sAvgEnemyLife:Number = 0;
var sLongestEnemyLife:Number = 0;
var sMostEnemiesOnscreen:Number = 0;
var sEnemiesAtDeath:Number = 0;
var sDistanceRan:Number = 0;
var sBest:Number = 0;

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
gameOver.x = -30;
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

hud1.pAmmo1.alpha = 0;
hud1.sgAmmo1.alpha = 0;
hud1.mgAmmo1.alpha = 0;
hud1.mgBig1.alpha = 0;
hud1.sgBig1.alpha = 0;
hud1.pBig1.alpha = 1;
hud1.dpBig1.alpha = 0;
//sfxSoundChannel = music1.play();
stats1.visible = false;
comboHolder.combo1.visible = false;
label1.visible = false;
black1.visible = false;
comboHolder.visible = false;
meter.visible = false;

stats1.best.alpha = 0;
stats1.statsKills1.pistolKills.alpha = 0;
stats1.statsKills1.doublePistolKills.alpha = 0;
stats1.statsKills1.machinegunKills.alpha = 0;
stats1.statsKills1.shotgunKills.alpha = 0;
stats1.statsDischarges1.pistolDis.alpha = 0;
stats1.statsDischarges1.doublePistolDis.alpha = 0;
stats1.statsDischarges1.machinegunDis.alpha = 0;
stats1.statsDischarges1.shotgunDis.alpha = 0;
stats1.statsDischarges1.discharges.alpha = 0;
stats1.statsAccuracy1.totalAcc.alpha = 0;
stats1.statsAccuracy1.pistolAcc.alpha = 0;
stats1.statsAccuracy1.doublePistolAcc.alpha = 0;
stats1.statsAccuracy1.machinegunAcc.alpha = 0;
stats1.statsAccuracy1.shotgunAcc.alpha = 0;
stats1.statsOther1.averageEnemyLife.alpha = 0;
stats1.statsOther1.longestLife.alpha = 0;
stats1.statsOther1.mostEnemies.alpha = 0;
stats1.statsOther1.enemiesDeath.alpha = 0;
stats1.statsOther1.distanceRan.alpha = 0;
stats1.controls1.alpha = 0;
gameplay = 0;
if (player1.weapon == "DP"){player1.shot.y = -26; player1.shot2.y = -26; player1.shot.x = 9;	player1.shot2.x = -9; player1.player1p.visible = false; player1.player1sg.visible = false; player1.player1dp.visible = true;}
if (player1.weapon == "P"){player1.shot.y = -24.5;player1.shot.x = 0; player1.player1p.visible = true; player1.player1sg.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "MG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "SG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}
black1.visible = true;
stats1.statsKills1.x	= 0;
stats1.statsDischarges1.x	= 450;
stats1.statsAccuracy1.x	= 900;
stats1.arrows.alpha = 0;
stats1.arrows.arrow1.alpha = 0;


//sfxSoundChannel = stompSFX1.play();
//declarations

black1.addEventListener(MouseEvent.CLICK, click_handler);
function click_handler(event_object:MouseEvent) {
gameplay = 1;
black1.clicky.visible = false;

}


function discharge(){
if (player1.alive == 1 && gameplay == 1){
label1.visible = true;
//meter.visible = true;

findingTargetKill = 2;
findingTarget = 1;
player1.shot.alpha = 1;
if (player1.weapon == "MG"){if (heat < 2){meter.drain.width -= 150; dischargeCount+=1;sMachinegunDischarges += 1; if (mute == 0){sfxSoundChannel = pistol1.play();}player1.mg -= 1; if (player1.mg < 11 && mute == 0){sfxSoundChannel = clickSFX1.play();}}heat = 3; }
else if (player1.weapon == "SG"){if (heat < 19){meter.drain.width -= 900; dischargeCount+=1;sShotgunDischarges += 1; if (mute == 0){sfxSoundChannel = shotgunSFX1.play();} if (player1.sg < 4 && mute == 0){sfxSoundChannel = clickSFX1.play();}} heat = 20; player1.shot.alpha = 0;  player1.shotSG1.alpha = 1; }
else if (player1.weapon == "DP"){findingTarget = 2; player1.shot2.alpha = 1; if (heat < 8){meter.drain.width -= 400; dischargeCount+=1; sDoublePistolDischarges += 1; if (mute == 0){sfxSoundChannel = doublePistolsSFX1.play();}player1.dp -= 1; if (player1.dp < 6 && mute == 0){sfxSoundChannel = clickSFX1.play();}} heat = 9; }
else {player1.weapon = "P";}
if (player1.weapon == "P"){if (heat < 8){meter.drain.width -= 400; dischargeCount+=1; sPistolDischarges += 1; if (mute == 0){sfxSoundChannel = pistol2SFX1.play();}}heat = 9;}

shotStay = 2;



if (player1.sup == 1){closest = -1650; closest2 = -1650; closest3 = -1650; closest4 = -1650; closest5 = -1650;}
if (player1.sdown == 1){closest = 1650; closest2 = 1650; closest3 = 1650; closest4 = 1650; closest5 = 1650;}
if (player1.sleft == 1){closest = -1650; closest2 = -1650; closest3 = -1650; closest4 = -1650; closest5 = -1650;}
if (player1.sright == 1){closest = 1650; closest2old = 1650; closest2 = 1650; closest3 = 1650; closest4 = 1650; closest5 = 1650;}
//diags
if (player1.sup == 1 && player1.sright == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sdown == 1 && player1.sright == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sdown == 1 && player1.sleft == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.sup == 1 && player1.sleft == 1){closest = 16500; closest2 = 16500; closest3 = 16500; closest4 = 16500; closest5 = 16500;}
if (player1.weapon == "SG"){
closest = 17000;	
closest2 = 17000;	
closest3 = 17000;	
closest4 = 17000;	
closest5 = 17000;	
}
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
newBot.age = 0;

//smooth agilitys from 3-5. everyone has different speeds
if (botsKilled < 200){newBot.agility = Math.floor(Math.random() * (1+6000-3000)) + 3000;}
if (botsKilled >= 200){newBot.agility = Math.floor(Math.random() * (1+7000-4000)) + 4000;}
newBot.quick = Math.floor(Math.random() * (1+10-1)) + 1;
if (botNum > 150 && newBot.quick == 1){newBot.agility = 8; newBot.botBody2.alpha = 1; newBot.botBody.alpha = 0;}
if ((botsKilled < 200 && newBot.agility > 3000 && newBot.agility <= 4000) || (botsKilled >= 200 && newBot.agility > 4000 && newBot.agility <= 5000)){ newBot.botBody3.alpha = 1; newBot.botBody.alpha = 0;}
if ((botsKilled < 200 && newBot.agility > 5000 && newBot.agility <= 6000) || (botsKilled >= 200 && newBot.agility > 6000 && newBot.agility <= 7000)){ newBot.botBody4.alpha = 1; newBot.botBody.alpha = 0;}
if (newBot.agility != 8)newBot.agility /= 1000;
if (botsKilled < 100){newBot.agility -= 1;}
if (botsKilled > 500){newBot.agility += 1;}
//newBot.agility /= 3;

newBot.shotAngle = "up";
newBot.tate = 0;
//newBot.rotation =
newBot.entry = xEntry;
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (temp == 1){
if (xEntry == 1){newBot.rotation = 180; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 0;}
if (xEntry == 2){newBot.rotation =270; newBot.x = 1150; newBot.y = Math.floor(Math.random() * (1+630-450)) + 450;}
if (xEntry == 3){newBot.rotation = 0; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 650;}
if (xEntry == 4){newBot.rotation = 90; newBot.x = 0; newBot.y = Math.floor(Math.random() * (1+280-100)) + 100;}
}
else{
if (xEntry2 == 1){newBot.rotation = 180; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 0;}
if (xEntry2 == 2){newBot.rotation =270; newBot.x = 1150; newBot.y = Math.floor(Math.random() * (1+630-450)) + 450;}
if (xEntry2 == 3){newBot.rotation = 0; newBot.x = Math.floor(Math.random() * (1+675-475)) + 475; newBot.y = 650;}
if (xEntry2 == 4){newBot.rotation = 90; newBot.x = 0; newBot.y = Math.floor(Math.random() * (1+280-100)) + 100;}
}

//newBot.alpha = 0;
}

function botFrame(e:Event):void{
if (e.target.x == 0 && e.target.y == 0){
e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
removeChild(MovieClip(e.target));
}
else if (e.target.alpha == 0){e.target.alpha = 1;}

if (gameplay == 0){
e.target.botLegs.stop();
e.target.stop();
}
if (gameplay == 1){
e.target.age += (1/30);

if (e.target.age > sLongestEnemyLife){sLongestEnemyLife = e.target.age;}

if (e.target.age > 30 && player1.alive != 1 && e.target.botNum > botsKilled + 20){
if (e.target.x < player1.x + playerSize/2 - 20 + 25 && e.target.x > player1.x - playerSize/2 - 25 + 20 && e.target.y < player1.y + playerSize/2 + 25 - 20 && e.target.y > player1.y - playerSize/2 - 25 + 20){
e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
removeChild(MovieClip(e.target));
//botsKilled += 1;
}
}


e.target.play();
e.target.botLegs.play();
//kill bot
if (clearing>0){
e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
removeChild(MovieClip(e.target));
}

if (findingTargetKill > 0 && e.target.killme == 1 && player1.weapon == "SG" && (e.target.dist1 < closest || e.target.dist1 == closest || e.target.dist1 == closest2 || e.target.dist1 == closest3 || e.target.dist1 == closest4 || e.target.dist1 == closest5)){
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target));	streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled; sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		if (e.target.dist1 == closest){closest = 17000;}
		if (e.target.dist1 == closest2){closest2 = 17000;}
		if (e.target.dist1 == closest3){closest2 = 17000;}
		if (e.target.dist1 == closest4){closest2 = 17000;}
		if (e.target.dist1 == closest5){closest2 = 17000;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
}
else{

if (e.target.killme == 1 && player1.alive == 1 && (e.target.x == closest || (e.target.x == closest2 && player1.weapon == "DP")) && (e.target.shotAngle == "left" || e.target.shotAngle == "right")){
if (e.target.x == closest){closest = 0;}
if (e.target.x == closest2){closest2 = 0;}
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		e.target.alive = 0;
		findingTarget -= 1;
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
	}
	if (e.target.killme == 1 && player1.alive == 1 && (((e.target.y == closest && e.target.shotAngle == "up") || (e.target.y == closest && e.target.shotAngle == "down")) || (e.target.y == closest2 && player1.weapon == "DP"))){
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		if (e.target.y == closest){closest = 0;}
		if (e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
	}
	//diags
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "upleft" && (-e.target.x - e.target.y == closest || (-e.target.x - e.target.y == closest2 && player1.weapon == "DP"))){
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		if (-e.target.x - e.target.y == closest){closest = 0;}
		if (-e.target.x - e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "upright" && e.target.x - e.target.y == closest || ((e.target.dist1 == closest || e.target.dist1 == closest2) && player1.weapon == "DP")){
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		if (e.target.dist1 == closest){closest = 0;}
		if (e.target.dist1 == closest2){closest2 = 0;}
 		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "downright" && (e.target.x + e.target.y == closest || (e.target.x + e.target.y == closest2 && player1.weapon == "DP"))){
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		if (e.target.x + e.target.y == closest){closest = 0;}
		if (e.target.x + e.target.y == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
	}
	if (e.target.killme == 1 && player1.alive == 1 && e.target.shotAngle == "downleft" && (e.target.y - e.target.x == closest || (e.target.y - e.target.x == closest2 && player1.weapon == "DP"))){
temp = Math.floor(Math.random() * (1+2-1)) + 1;
if (mute == 0){ if (temp == 1){sfxSoundChannel = dead2SFX1.play();}
if (temp == 2){sfxSoundChannel = deadSFX1.play();}}
		botsKilled += 1;
		e.target.removeEventListener(Event.ENTER_FRAME, botFrame);
		removeChild(MovieClip(e.target)); streak = 0; chain += 1; if (player1.weapon == "DP"){sDoublePistolKills += 1;}  if (player1.weapon == "P"){sPistolKills += 1;}  if (player1.weapon == "SG"){sShotgunKills += 1;}  if (player1.weapon == "MG"){sMachinegunKills += 1;} sAvgEnemyLife = ((sAvgEnemyLife * botsKilled) + e.target.age) / botsKilled;
		e.target.alive = 0;
		if (e.target.y - e.target.x == closest){closest = 0;}
		if (e.target.y - e.target.x == closest2){closest2 = 0;}
		xX = e.target.x;
		xY = e.target.y;
		xRotation = e.target.rotation;
		createDead();
		createBlood();
		findingTarget -= 1;
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
//killing player1 detection kill player player hit detection
if (e.target.alive == 1 && e.target.x < player1.x + playerSize/2 - 2 && e.target.x > player1.x - playerSize/2 + 2 && e.target.y < player1.y + playerSize/2 - 2 && e.target.y > player1.y - playerSize/2 + 2){
player1.alive = 0;
}
	
//killmes
if (findingTarget > 0 && e.target.alive == 1){
	
if (player1.weapon == "P" || player1.weapon == "MG"){
	if (player1.sup == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y < player1.y && e.target.x < player1.x + playerSize/2 + 15 && e.target.x > player1.x - playerSize/2 - 15){
		if (e.target.y > closest){closest2 = closest; closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "up";}
	}
	if (player1.sdown == 1 && player1.sleft == 0 && player1.sright == 0 && e.target.y > player1.y && e.target.x < player1.x + playerSize/2 + 15 && e.target.x > player1.x - playerSize/2 - 15){
		if (e.target.y < closest){closest2 = closest; closest = e.target.y; e.target.killme = 1; e.target.shotAngle = "down";}
	}
	if (player1.sleft == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x < player1.x && e.target.y < player1.y + playerSize/2 + 15 && e.target.y > player1.y - playerSize/2 - 15){
		if (e.target.x > closest){closest2 = closest; closest = e.target.x; e.target.killme = 1; e.target.shotAngle = "left";}
	}
	if (player1.sright == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.x > player1.x && e.target.y < player1.y + playerSize/2 + 15 && e.target.y > player1.y - playerSize/2 - 15){
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
	if (-e.target.x + e.target.y < closest2){closest2old = closest2; closest2 = e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "downleft";}
	if (-e.target.x + e.target.y < closest){closest2 = closest; closest = e.target.y - e.target.x; e.target.killme = 1; e.target.shotAngle = "downleft";}
	if (closest == closest2){closest2 = closest2old;}
	}
}//end for loop
}//end detecting if player is shooting diagonally
}//end DP condition

if (player1.weapon == "SG"){
		if (player1.sup == 1 && player1.sleft == 0 && player1.sright == 0 && ((e.target.rotation >= 130 && e.target.rotation <= 180) || (e.target.rotation >= -180 && e.target.rotation <= -130)) && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "up";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "up";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "up";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "up";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "up"; e.target.killme = 1;} 
		}
		
		if (player1.sright == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.rotation <= -40 && e.target.rotation >= -140 && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "right";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "right";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "right";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "right";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "right"; e.target.killme = 1;} 
		}

		if (player1.sdown == 1 && player1.sright == 0 && player1.sleft == 0 && e.target.rotation >= -50 && e.target.rotation <= 50 && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "down";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "down";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "down";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "down";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "down"; e.target.killme = 1;} 
		}

		if (player1.sleft == 1 && player1.sup == 0 && player1.sdown == 0 && e.target.rotation >= 40 && e.target.rotation <= 140 && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "left";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "left";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "left";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "left";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "left"; e.target.killme = 1;} 
		}
	
		if (player1.sright == 1 && player1.sup == 1 && ((e.target.rotation <= -85 && e.target.rotation >= -185)) && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "upright";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "upright";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "upright";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "upright";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "upright"; e.target.killme = 1;} 
		}

		if (player1.sright == 1 && player1.sdown == 1 && ((e.target.rotation <= 5 && e.target.rotation >= -95)) && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "downright";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "downright";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "downright";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "downright";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "downright"; e.target.killme = 1;} 
		}

		if (player1.sleft == 1 && player1.sdown == 1 && ((e.target.rotation <= 95 && e.target.rotation >= -5)) && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "downleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "downleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "downleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "downleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "downleft"; e.target.killme = 1;} 
		}

		if (player1.sleft == 1 && player1.sup == 1 && ((e.target.rotation <= 180 && e.target.rotation >= 85)) && e.target.dist1 < 300){
		if (e.target.dist1 < closest5){closest5 = e.target.dist1; e.target.shotAngle = "upleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest4){closest5 = closest4; closest4 = e.target.dist1; e.target.shotAngle = "upleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest3){closest5 = closest4; closest4 = closest3; closest3 = e.target.dist1; e.target.shotAngle = "upleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest2){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = e.target.dist1; e.target.shotAngle = "upleft";	e.target.killme = 1;}
		if (e.target.dist1 < closest){closest5 = closest4; closest4 = closest3; closest3 = closest2; closest2 = closest; closest = e.target.dist1; e.target.shotAngle = "upleft"; e.target.killme = 1;} 
		}

//((e.target.rotation > -45 && e.target.rotation < 0) || (e.target.rotation > 0 && e.target.rotation < 45))
}// SG condition



}// end findingTarget > 0


} // end gameplay condition
}//end botFrame

function createDead(){

var newDead:dead = new dead();
highestBody += 1;



meter.drain.width = 1400;
sCombo += 1;

addChildAt(newDead,highestBody);
newDead.addEventListener(Event.ENTER_FRAME, deadFrame);
newDead.timer = 100;
if (player1.weapon == "P"){newDead.force = 20 / zoom;}
if (player1.weapon == "DP"){newDead.force = 28 / zoom;}
if (player1.weapon == "MG"){newDead.force = 20 / zoom;}
if (player1.weapon == "SG"){newDead.force = 34 / zoom;}
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
newDoublePistols.alpha = 3;
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
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2 + 5) && (player1.x + playerSize/2 > e.target.x - e.target.width/2 - 5) && (player1.y - playerSize/2 < e.target.y + e.target.height/2 + 5) && (player1.y + playerSize/2 > e.target.y - e.target.height/2 - 5)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "DP";
		player1.dp += 32;
		if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}
}
if (e.target.stop){e.target.play();}
}//gameplay
else {e.target.stop();}
}//end doublePistolsFrame

function createMachinegun(){
var newMachinegun:machinegun = new machinegun();
addChild(newMachinegun);
newMachinegun.addEventListener(Event.ENTER_FRAME, machinegunFrame);
newMachinegun.x = xX;
newMachinegun.y = xY;
newMachinegun.alpha = 3;
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
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2 + 5) && (player1.x + playerSize/2 > e.target.x - e.target.width/2 - 5) && (player1.y - playerSize/2 < e.target.y + e.target.height/2 + 5) && (player1.y + playerSize/2 > e.target.y - e.target.height/2 - 5)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "MG";
		player1.mg += 60;
		player1.player1p.visible = false;
		player1.player1sg.visible = true;
		if(mute == 0){sfxSoundChannel = mgPickSFX1.play();}
}
if (e.target.stop){e.target.play();}
}//gameplay
else {e.target.stop();}
}//end machinegunFrame

function createShotgun(){
var newShotgun:shotgun = new shotgun();
addChild(newShotgun);
newShotgun.addEventListener(Event.ENTER_FRAME, shotgunFrame);
newShotgun.x = xX;
newShotgun.y = xY;
newShotgun.alpha = 3;
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
if (player1.alive == 1 && e.target.got == 0 && (player1.x - playerSize/2 < e.target.x + e.target.width/2 + 5) && (player1.x + playerSize/2 > e.target.x - e.target.width/2 - 5) && (player1.y - playerSize/2 < e.target.y + e.target.height/2 + 5) && (player1.y + playerSize/2 > e.target.y - e.target.height/2 - 5)){
		e.target.got = 1;
		e.target.alpha = 1;
		player1.weapon = "SG";
		player1.sg += 12;
		player1.player1p.visible = false;
		player1.player1sg.visible = true;
		if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}
}
if (e.target.stop){e.target.play();}
}//gameplay
else {e.target.stop();}
}//end shotgunFrame




//timer1 teimr1 tiemer1 tiemr1
addEventListener(Event.ENTER_FRAME, fl_EnterFrameHandler);
function fl_EnterFrameHandler(event:Event):void{

if (gameplay == 0){
legs.stop();
}
if (gameplay == 1){
if (player1.alive == 1){black1.visible = false;}
black1.clicky.visible = false;
black1.text1.visible = false;
black1.text2.visible = false;

setChildIndex(black1,numChildren-1);
setChildIndex(comboHolder,numChildren-1);
setChildIndex(meter,numChildren-1);
setChildIndex(kills,numChildren-1);
setChildIndex(stats1,numChildren-1);
setChildIndex(label1,numChildren-1);
setChildIndex(hud1,numChildren-1);
setChildIndex(gameOver,numChildren-1);


if (sCombo >= 2){
comboHolder.combo1.text = "x" + sCombo;
formatKillsText.size = sCombo/2 + 35;
if (formatKillsText.size > 170){formatKillsText.size = 170;}
comboHolder.combo1.setTextFormat(formatKillsText);
//if (meter.drain.width < 30 && shotStay <= 0){sCombo = 0;}
comboHolder.combo1.y = -93.15;
comboHolder.alpha = 2;
comboFall = -15;
}
meter.drain.width -= 30;
if (meter.drain.width < 30){meter.drain.width = 2;}

if (sCombo < 2){
comboFall += 5;
comboHolder.combo1.y += comboFall;
comboHolder.alpha -= .2;
//fall
} else {comboHolder.combo1.visible = true;}
//sCombo < 2
if (botNum - botsKilled > sMostEnemiesOnscreen){sMostEnemiesOnscreen = botNum - botsKilled;}

if (findingTargetKill > 0){findingTargetKill-=1;}
if (player1.weapon == "DP" && player1.sup == 1){xRotation+=1;}
else if (findingTargetKill <=0){findingTargetKill = 2; findingTarget = 0;}
streak+=1;

label1.text = "Accuracy:" + String(Math.round(botsKilled/dischargeCount*1000)/10) + "%";


//label1.text = String(statFocus);

if (shotStay == 0){
if (player1.weapon == "DP" && player1.dp <= 0){player1.weapon = "P"; 
	if (player1.sg > 0) {player1.weapon = "SG"; if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}}
	else if (player1.mg > 0) {player1.weapon = "MG";if(mute == 0){ sfxSoundChannel = mgPickSFX1.play();}}
	else if (player1.dp > 0) {player1.weapon = "DP"; if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}}
}
if (player1.weapon == "MG" && player1.mg <= 0){player1.weapon = "P"; heat = 9;
	if (player1.sg > 0) {player1.weapon = "SG"; if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}}
	else if (player1.mg > 0) {player1.weapon = "MG";if(mute == 0){ sfxSoundChannel = mgPickSFX1.play();}}
	else if (player1.dp > 0) {player1.weapon = "DP"; if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}}
}
if (player1.weapon == "SG" && player1.sg <= 0){player1.weapon = "P";
	if (player1.sg > 0) {player1.weapon = "SG"; if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}}
	else if (player1.mg > 0) {player1.weapon = "MG";if(mute == 0){ sfxSoundChannel = mgPickSFX1.play();}}
	else if (player1.dp > 0) {player1.weapon = "DP"; if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}}
}
}


gateTimer-=1;
if (gateTimer<=0){
xEntry = Math.floor(Math.random() * (1+4-1)) + 1;
xEntry2 = Math.floor(Math.random() * (1+4-1)) + 1;
gateTimer	= (Math.floor(Math.random() * (1+50-1)) + 1) - botsKilled/50;
}	

legs.play();
hud1.ammo.x = -363.1;
hud1.ammo.x = -459;

if (player1.weapon == "P"){hud1.pBig1.alpha = .6;} else {hud1.pBig1.alpha = 0;}
if (player1.weapon == "DP"){hud1.dpBig1.alpha = .6;} else {hud1.dpBig1.alpha = 0;}
if (player1.weapon == "MG"){hud1.mgBig1.alpha = .6; kills.y = 82} else {hud1.mgBig1.alpha = 0; kills.y = 111.35}
if (player1.weapon == "SG"){hud1.sgBig1.alpha = .6;} else {hud1.sgBig1.alpha = 0;}

if (player1.weapon == "DP"){hud1.pAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.dp); if (player1.dp <= 9){hud1.ammo.text = "0" + String(player1.dp);} hud1.ammo.x = -363.1;} else {hud1.pAmmo1.alpha = 0;}
if (player1.weapon == "MG"){hud1.mgAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.mg); if (player1.mg <= 9){hud1.ammo.text = "0" + String(player1.mg);} hud1.ammo.x = -459;} else {hud1.mgAmmo1.alpha = 0;}
if (player1.weapon == "SG"){hud1.sgAmmo1.alpha = 1; hud1.ammo.alpha = 1; hud1.ammo.text = String(player1.sg); if (player1.sg <= 9){hud1.ammo.text = "0" + String(player1.sg);} hud1.ammo.x = -459;} else {hud1.sgAmmo1.alpha = 0;}
if (player1.weapon == "P"){hud1.ammo.alpha = 0 ;hud1.ammo.x = -363.1;}


kills.text = String(botsKilled) + " kills";
//formatKillsText.size = (botsKilled/ 5) + 15;
//if (formatKillsText.size > 170){formatKillsText.size = 170;}
//kills.setTextFormat(formatKillsText);
if (player1.x > 850 && player1.y < 200){kills.alpha = .4; hud1.alpha = .4;} else {kills.alpha = 1; hud1.alpha = 1;}
if (player1.x < 200 && player1.y < 100){meter.alpha = .4; label1.alpha = .4; comboHolder.combo1.alpha = .4;} else {meter.alpha = 1; label1.alpha = 1; comboHolder.combo1.alpha = 1;}


if (player1.weapon == "DP"){player1.shot.y = -26; player1.shot2.y = -26; player1.shot.x = 9;	player1.shot2.x = -9; player1.player1p.visible = false; player1.player1sg.visible = false; player1.player1dp.visible = true;}
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
weaponDrop = Math.floor(Math.random() * (1+1000-100)) + 100;
xX = Math.floor(Math.random() * (1+1050-100)) + 100;
xY = Math.floor(Math.random() * (1+600-50)) + 50;
xAgility = Math.floor(Math.random() * (1+3-1)) + 1;
//xAgility = 3;
if (xAgility == 1){createMachinegun();}
if (xAgility == 2){createDoublePistols();}
if (xAgility == 3){createShotgun();}
if (mute == 0){sfxSoundChannel = dropSFX1.play();}
}

if (player1.alive == 0){

bloodSpray -= 1;
if (bloodSpray <= 0){
xX = player1.x - 15 + Math.floor(Math.random() * (1+20-1)) + 1;
xY = player1.y - 15 + Math.floor(Math.random() * (1+20-1)) + 1;
createBlood();
bloodSpray = 10;
}

}



if (clearing>0){clearing-=1; player1.alive = 1;}
botTimer-=1;
if (botTimer <= 0 && ((player1.alive == 1 && botNum - botsKilled < 80) || (player1.alive == 0 && botNum - botsKilled < 70))){
botTimer = 13-(botsKilled/110);
if (botTimer < 5){botTimer = (botTimer+5+5)/3;}
//botTimer*=3;
createBot();
}
shotStay -= 1;
if (shotStay <= 0){
	if (player1.shotSG1.alpha == 1){ player1.sg -= 1;}
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
if (player1.kup == 1 && player1.y > 10){
	sDistanceRan += .003;
	player1.y -= 8 / zoom * gameSpeed;
	legs.rotation = 0;
}
if (player1.kdown == 1 && player1.y < 640){
	sDistanceRan += .003;
	player1.y += 8 / zoom * gameSpeed;
	legs.rotation = 180;
}
if (player1.kleft == 1 && player1.x > 10){
	sDistanceRan += .003;
	player1.x -= 8 / zoom * gameSpeed;
	legs.rotation = 270;
}
if (player1.kright == 1 && player1.x < 1140){
	sDistanceRan += .003;
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
}//end player1 == alive;

//Shooting directions
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


if (player1.alive == 0){legs.stop();}

if (player1.alive == 0){
	deadTimer += 1;
	stompTimer += 1;
if (stompTimer > 60){createBot(); stompTimer = 0;}

	setChildIndex(gameOver,numChildren-1);
	formatKillsText.size = botsKilled/5 + 40;
	if (formatKillsText.size > 120){formatKillsText.size = 120;}
	gameOver.setTextFormat(formatKillsText);

	gameOver.visible = true;		

if (deadTimer > 5){
	stats1.best.alpha = 1;
	}
if (deadTimer > 10){
	stats1.statsDischarges1.discharges.alpha = 1;
stats1.statsAccuracy1.totalAcc.alpha  = 1;
}
if (deadTimer > 15){
	stats1.statsKills1.pistolKills.alpha = 1;
	stats1.statsDischarges1.pistolDis.alpha = 1;
	stats1.statsAccuracy1.pistolAcc.alpha = 1;
}
if (deadTimer > 20){
	stats1.statsDischarges1.doublePistolDis.alpha = 1;
	stats1.statsKills1.doublePistolKills.alpha = 1;
	stats1.statsAccuracy1.doublePistolAcc.alpha = 1;
}
if (deadTimer > 25){
stats1.statsKills1.machinegunKills.alpha = 1;
stats1.statsDischarges1.machinegunDis.alpha = 1;
stats1.statsAccuracy1.machinegunAcc.alpha = 1;
}
if (deadTimer > 30){
stats1.statsKills1.shotgunKills.alpha = 1;	
stats1.statsDischarges1.shotgunDis.alpha = 1;
stats1.statsAccuracy1.shotgunAcc.alpha = 1;
}
if (deadTimer > 35){
stats1.controls1.alpha = 1;
	black1.visible = true;
	stats1.arrows.alpha = 1;
}
if (deadTimer > 40){
}

	//jesus

//if (gameOver.visible == false){sfxSoundChannel = perfectSFX1.play();}
	if (deadTimer < 2){if(mute == 0){sfxSoundChannel = p1DeadSFX1.play();}
	gameOver.text = String("you killed " + botsKilled + "\n" + " press [space] to restart");

	label1.visible = false;
	meter.visisble = false;
if (botsKilled > sBest){sBest = botsKilled;}
stats1.best.text = "best this session: " + String(sBest);
stats1.statsKills1.pistolKills.text = "pistol kills: " + String(sPistolKills);
stats1.statsKills1.doublePistolKills.text = "double pistol kills: " + String(sDoublePistolKills);
stats1.statsKills1.machinegunKills.text = "machinegun kills: " + String(sMachinegunKills);
stats1.statsKills1.shotgunKills.text = "shotgun kills: " + String(sShotgunKills);
stats1.statsDischarges1.pistolDis.text = "pistol discharges: " + String(sPistolDischarges);
stats1.statsDischarges1.doublePistolDis.text = "double pistol discharges: " + String(sDoublePistolDischarges);
stats1.statsDischarges1.machinegunDis.text = "machinegun discharges: " + String(sMachinegunDischarges);
stats1.statsDischarges1.shotgunDis.text = "shotgun discharges: " + String(sShotgunDischarges);
stats1.statsDischarges1.discharges.text = "total discharges: " + String(dischargeCount);
stats1.statsAccuracy1.totalAcc.text = "total accuracy: " + String(Math.round(botsKilled/dischargeCount*100*10)/10) + "%";
stats1.statsAccuracy1.pistolAcc.text = "pistol accuracy: " + String(Math.round(sPistolKills/sPistolDischarges*100*10)/10) + "%";
stats1.statsAccuracy1.doublePistolAcc.text = "double pistol accuracy: " + String(Math.round(sDoublePistolKills/sDoublePistolDischarges*100*10)/10) + "%";
stats1.statsAccuracy1.machinegunAcc.text = "machinegun accuracy: " + String(Math.round(sMachinegunKills/sMachinegunDischarges*100*10)/10) + "%";
stats1.statsAccuracy1.shotgunAcc.text = "shotgun accuracy: " + String(Math.round(sShotgunKills/sShotgunDischarges*100*10)/10) + "%";
stats1.statsOther1.averageEnemyLife.text = "average enemy lifespan: " + String(Math.round(sAvgEnemyLife*10)/10) + " seconds";
stats1.statsOther1.longestLife.text = "longest enemy lifespan: " + String(Math.round(sLongestEnemyLife*10)/10) + " seconds";
stats1.statsOther1.mostEnemies.text = "most enemies onscreen: " + String(sMostEnemiesOnscreen);
stats1.statsOther1.enemiesDeath.text = "enemies onscreen at death: " + String(botNum - botsKilled);
stats1.statsOther1.distanceRan.text = "distance ran: " + String(Math.round(sDistanceRan*100*10)/10) + " feet";

botsKilled /= 2;	

	stats1.visible = true;
	setChildIndex(stats1,numChildren-1);

botsKilled /= 2;	

}//end one time
meter.alpha = 0;
comboHolder.alpha = 0;

	hud1.alpha = 0;
	kills.alpha = 0;

	stats1.statsDischarges1.alpha = 1 - Math.abs(stats1.statsDischarges1.x / 271);
	stats1.statsAccuracy1.alpha = 1 - Math.abs(stats1.statsAccuracy1.x / 271);
	stats1.statsKills1.alpha = 1 - Math.abs(stats1.statsKills1.x / 271);
	stats1.statsOther1.alpha = 1 - Math.abs(stats1.statsOther1.x / 271);

//here
if (stats1.arrows.arrow1.x <= -300){
	stats1.arrows.dir = "IN";
}
if (stats1.arrows.arrow1.x >= -275){
	stats1.arrows.dir = "OUT";
}
if (stats1.arrows.dir == "OUT"){
stats1.arrows.arrow1.x -= 1.25;
stats1.arrows.arrow2.x += 1.25;
}
if (stats1.arrows.dir == "IN"){
stats1.arrows.arrow1.x += 1.25;
stats1.arrows.arrow2.x -= 1.25;
}

if (deadTimer > 40){
if (statDir == "RIGHT"){
	stats1.statsDischarges1.x-=50;
	stats1.statsKills1.x-=50;
	stats1.statsAccuracy1.x-=50;
	stats1.statsOther1.x-=50;
	}
if (statDir == "LEFT"){
	stats1.statsDischarges1.x+=50;
	stats1.statsKills1.x+=50;
	stats1.statsAccuracy1.x+=50;
	stats1.statsOther1.x+=50;
	}
		if (statFocus == "DISCHARGES"){
		stats1.statsAccuracy1.x = stats1.statsDischarges1.x + 450;
		stats1.statsKills1.x = stats1.statsDischarges1.x - 450;
	}	
	if (statFocus == "KILLS"){
		stats1.statsDischarges1.x = stats1.statsKills1.x + 450;
		stats1.statsOther1.x = stats1.statsKills1.x - 450;
	}	
	if (statFocus == "ACCURACY"){
		stats1.statsOther1.x = stats1.statsAccuracy1.x + 450;
		stats1.statsDischarges1.x = stats1.statsAccuracy1.x - 450;
	}	
	if (statFocus == "OTHER"){
		stats1.statsKills1.x = stats1.statsOther1.x + 450;
		stats1.statsAccuracy1.x = stats1.statsOther1.x - 450;
	}	

	if (stats1.statsDischarges1.x == 0 || stats1.statsAccuracy1.x == 0 || stats1.statsOther1.x == 0 || stats1.statsKills1.x == 0){
	statDir = 0;
	if (stats1.statsDischarges1.x == 0){statFocus = "DISCHARGES";}
	if (stats1.statsKills1.x == 0){statFocus = "KILLS";}
	if (stats1.statsOther1.x == 0){statFocus = "OTHER";}
	if (stats1.statsAccuracy1.x == 0){statFocus = "ACCURACY";}
	}
}
}//deadTimer > xx

if (player1.weapon == "DP" && player1.dp <= 0){hud1.ammo.text = "00";}
if (player1.weapon == "MG" && player1.mg <= 0){hud1.ammo.text = "00";}
if (player1.weapon == "SG" && player1.sg <= 0){hud1.ammo.text = "00";}

}// end gameplay condition

label2.text = String(numChildren);
label3.text = String(player1.weapon);
//label4.text = String();

if (player1.weapon == "DP"){player1.shot.y = -26; player1.shot2.y = -26; player1.shot.x = 9;	player1.shot2.x = -9; player1.player1p.visible = false; player1.player1sg.visible = false; player1.player1dp.visible = true;}
if (player1.weapon == "P"){player1.shot.y = -24.5;player1.shot.x = 0; player1.player1p.visible = true; player1.player1sg.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "MG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}
if (player1.weapon == "SG"){player1.shot.y = -31; player1.player1sg.visible = true;  player1.player1p.visible = false; player1.player1dp.visible = false;}

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
		//menu left
if (deadTimer > 40){
		if (player1.alive == 0 && hold == 0 && statFocus != "KILLS"){
			hold = 1;
			statDir = "LEFT"; 
			if (statFocus == "OTHER"){statFocus = "ACCURACY";}
			else if (statFocus == "KILLS"){statFocus = "OTHER";}
			else if (statFocus == "DISCHARGES"){statFocus = "KILLS";}
			else if (statFocus == "ACCURACY"){statFocus = "DISCHARGES";}
			stats1.statsKills1.x += 50;
			stats1.statsDischarges1.x += 50;
			stats1.statsAccuracy1.x += 50;
			stats1.statsOther1.x += 50;
		}
}

	}
	if (event.keyCode == Keyboard.RIGHT){	
	if (player1.sright==0){
		player1.sright = 1;
		player1.aiming = 15;
		discharge();
	}
	//menu right
if (deadTimer > 40){
		if (player1.alive == 0 && hold == 0 && statFocus != "ACCURACY"){
			hold = 1;
			stats1.arrows.arrow1.alpha = 1;
			statDir = "RIGHT"; 
			if (statFocus == "OTHER"){statFocus = "KILLS";}
			else if (statFocus == "KILLS"){statFocus = "DISCHARGES";}
			else if (statFocus == "DISCHARGES"){statFocus = "ACCURACY";}
			else if (statFocus == "ACCURACY"){statFocus = "OTHER";}
			stats1.statsKills1.x -= 50;
			stats1.statsDischarges1.x -= 50;
			stats1.statsAccuracy1.x -= 50;
			stats1.statsOther1.x -= 50;
		}
}//deadTimer >
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
	if (event.keyCode == Keyboard.M){	


if (mute == 1){mute = 0;}
else if (mute == 0){mute = 1;}

}

if (event.keyCode == Keyboard.SPACE){	
	if (gameplay == 1 && player1.alive == 1){gameplay = 0;} else {gameplay = 1;}
	//restart
	if (player1.alive == 0){
		stats1.arrows.alpha = 0;
stats1.best.alpha = 0;
stats1.statsKills1.pistolKills.alpha = 0;
stats1.statsKills1.doublePistolKills.alpha = 0;
stats1.statsKills1.machinegunKills.alpha = 0;
stats1.statsKills1.shotgunKills.alpha = 0;
stats1.statsDischarges1.pistolDis.alpha = 0;
stats1.statsDischarges1.doublePistolDis.alpha = 0;
stats1.statsDischarges1.machinegunDis.alpha = 0;
//here
stats1.statsDischarges1.shotgunDis.alpha = 0;
stats1.statsDischarges1.discharges.alpha = 0;
stats1.statsAccuracy1.totalAcc.alpha = 0;
stats1.statsAccuracy1.pistolAcc.alpha = 0;
stats1.statsAccuracy1.doublePistolAcc.alpha = 0;
stats1.statsAccuracy1.machinegunAcc.alpha = 0;
stats1.statsAccuracy1.shotgunAcc.alpha = 0;
stats1.statsOther1.averageEnemyLife.alpha = 0;
stats1.statsOther1.longestLife.alpha = 0;
stats1.statsOther1.mostEnemies.alpha = 0;
stats1.statsOther1.enemiesDeath.alpha = 0;
stats1.statsOther1.distanceRan.alpha = 0;
stats1.controls1.alpha = 0;

deadTimer = 0;
sPistolKills = 0;
sDoublePistolKills = 0;
sMachinegunKills = 0;
sShotgunKills = 0;
sPistolDischarges = 0;
sDoublePistolDischarges = 0;
sMachinegunDischarges = 0;
sShotgunDischarges = 0;
dischargeCount = 0;
sAvgEnemyLife = 0;
sLongestEnemyLife = 0;
sMostEnemiesOnscreen = 0;
sEnemiesAtDeath = 0;
sDistanceRan = 0;
		
	//sfxSoundChannel = music1.play();
	stats1.visible = false;
	hud1.alpha = 1;
	kills.alpha = 1;
	botNum = 0;
	botsKilled = 0;
	dischargeCount = 0;
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
	weaponDrop = Math.floor(Math.random() * (1+800-50)) + 50;
	}
	}
	if (event.keyCode == 49){	
	player1.weapon = "P"; 		if(mute == 0){sfxSoundChannel = pPickSFX1.play();}
	}
	if (event.keyCode == 50){	
	if (player1.dp > 0) {player1.weapon = "DP";		if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}}
	}
	if (event.keyCode == 51){	
	if (player1.mg > 0) {player1.weapon = "MG";		if(mute == 0){sfxSoundChannel = mgPickSFX1.play();}}
	}
	if (event.keyCode == 52){	
	if (player1.sg > 0) {player1.weapon = "SG";		if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}}
	}
	if (event.keyCode == Keyboard.Q || event.keyCode == Keyboard.END){	
	if (player1.alive == 1){
	if (player1.weapon != "P") {player1.weapon = "P"; if(mute == 0){sfxSoundChannel = pPickSFX1.play();}}
	else if (player1.sg > 0) {player1.weapon = "SG"; if(mute == 0){sfxSoundChannel = sgPickSFX1.play();}}
	else if (player1.mg > 0) {player1.weapon = "MG";if(mute == 0){ sfxSoundChannel = mgPickSFX1.play();}}
	else if (player1.dp > 0) {player1.weapon = "DP"; if(mute == 0){sfxSoundChannel = dpPickSFX1.play();}}
	}//player 1 alive == 0
	
	}

if (event.keyCode == 220 && player1.alive == 0){	
weaponDrop = Math.floor(Math.random() * (1+1000-100)) + 100;
xX = Math.floor(Math.random() * (1+1050-100)) + 100;
xY = Math.floor(Math.random() * (1+600-50)) + 50;
xAgility = Math.floor(Math.random() * (1+3-1)) + 1;
//xAgility = 3;
if (xAgility == 1){createMachinegun();}
if (xAgility == 2){createDoublePistols();}
if (xAgility == 3){createShotgun();}
if (mute == 0){sfxSoundChannel = dropSFX1.play();}
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
		hold = 0;
	}
	if (event.keyCode == Keyboard.RIGHT){	
		player1.sright = 0;
		hold = 0;
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
