package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import sys.FileSystem;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Dynamic> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		trace("finding mod shit");
		if (FileSystem.exists(Paths.mods())) {
			trace("mods folder");
			if (FileSystem.exists(Paths.modFolders("data/credits.txt"))){
				trace("credit file");
				var firstarray:Array<String> = CoolUtil.coolTextFile(Paths.modFolders("data/credits.txt"));
				trace("found credit shit");
				
				for(i in firstarray){
					var arr:Array<String> = i.split("::");
					trace(arr);
					creditsStuff.push(arr);
				}
			}
		}
		
		#end
		var pisspoop = [ //Name - Icon name - Description - Link - BG Color
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	'0xFFFFDD33'],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		'0xFFC30085'],
		[''],
		['Engine Contributors'],
		['shubs',				'shubs',			'New Input System Programmer',						'https://twitter.com/yoshubs',			'0xFF4494E6'],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	'0xFFE01F32'],
		['gedehari',			'gedehari',			'Chart Editor\'s Sound Waveform base',				'https://twitter.com/gedehari',			'0xFFFF9300'],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			'0xFFFFFFFF'],
		['SandPlanet',			'sandplanet',		'Mascot\'s Owner\nMain Supporter of the Engine',		'https://twitter.com/SandPlanetNG',	'0xFFD10616'],
		['bubba',				'bubba',		'Guest Composer for "Hot Dilf"',	'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',	'0xFF61536A'],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	'0xFFF73838'],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	'0xFFFFBB1B'],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			'0xFF53E52C'],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		'0xFF6475F3'],
		[''],
		["VS Sly Development Team"],
		['SamTheSly',		'samthesly',	"Director, Art, Music, Coding, Charting, Cutscenes",				'https://www.youtube.com/channel/UCvOv75LKEwqLFYtndUcfC8w',	'0xFF7b47a8'],
		['Lemonking',		'lemonking',	"Lead Coder",				'https://twitter.com/1emonking',	'0xFF663a82'],
		['Teniente Mantequilla',		'TMr_click',	"Porting/Coding",				'https://www.twitch.tv/tmr_click',	'0xFF61945f'],
		['Runnerdude127',		'runnerdude127',	"Roger Creator, Roger Music, Roger Sprites/Animation, Roger Voice Acting",	'https://twitter.com/Runnerdude127',	'0xFFdb872c'],
		['Vidz',		'vidz',	"Coder",				'https://youtube.com/c/ItsVidz',	'0xFF567cd6'],
		['FatCat',		'fatcat',	"Sprite Animation",				'https://twitter.com/FatCat96864561?t=x_SQaI6kmQ7fy9zVy-VONA&s=09',	'0xFFb08717'],
		['Lemony',		'lemony',	"Sprite Animation",				'',	'0xFF756a5d'],
		['maple',		'maple',	"Sprite Animation",				'https://twitter.com/mmmmmmmmmaple',	'0xFFD72323'],
		['IL tofu',		'IL_tofu',	"Sprite Animation",				'https://twitter.com/il_tofu',	'0xFFb04966'],
		['ZenusPurity_',		'',	"Modcharting",				'',	'0xFFb53a3a'],
		['Zenokwei aka ILuvGemz',		'Zenokwei_aka_ILuvGemz',	"Coder",				'https://youtube.com/c/ZenokweiAka%E5%8D%83%E3%81%AE%E5%A3%B0 ',	'0xFF7FB7D3'],
		['ShouSuchus',		'shousuchus',	"Coder",				'https://twitter.com/ShouSuchus',	'0xFFf73e3e'],
		['Fidget Spinner Animations',		'fidget_spinner_animations',	"Coder",				'https://www.youtube.com/channel/UCknRWVWQvDHf8RXXiuzAN3A',	'0xFFff7272'],
		['DiscWraith',		'discwraith',	"Charting",				'https://twitter.com/DiscWraith',	'0xFFE398FA'],
		['CommanderLilac',		'',	"Porting/Coding",				'https://twitter.com/CommanderLilac',	'0xFFf7adda'],
		['CritVA',		'',	"Voice Acting",				'https://www.youtube.com/c/CritVA',	'0xFF363636'],
		['ash237',		'',	"OG Sly Sprite Animator",				'https://twitter.com/ash__i_guess_',	'0xFFe3e3e3'],
		["Quake - Callie Mae & CritVA Remix (Triple Threat) Credits"],
		['Callie Mae',		'',	"Music",				'https://www.youtube.com/channel/UCjsUCGBofGpdxtwVURGzR2A',	'0xFF87bcc7'],
		['CritVA',		'',	"Music",				'https://www.youtube.com/c/CritVA',	'0xFF363636'],
		['Sheenoboo',		'',	"Charting",				'https://twitter.com/SheenobooVT',	'0xFF8987c7']
	];
		
		
				for(i in pisspoop){
					creditsStuff.push(i);
				}
			
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = Std.parseInt(creditsStuff[curSelected][4]);
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int =  Std.parseInt(creditsStuff[curSelected][4]);
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
