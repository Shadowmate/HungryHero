package screens
{
	import starling.display.Sprite;
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class About extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		
		private var backBtn:Button;
		
		public function About()
		{
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			super();
		}
		
		private function onAddedToStage():void
		{
			
			trace("welcome screen initialized");
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			title = new Image(Assets.getAtlas().getTexture("welcome_title"));
			title.x = 440;
			title.y = 20;
			this.addChild(title);
			
			
			backBtn = new Button(Assets.getTexture("WelcomeBackBtn"));
			backBtn.x = 500;
			backBtn.y = 300;
			backBtn.height = 60;
			backBtn.width = 100;
			this.addChild(backBtn);
			
			this.addEventListener(Event.TRIGGERED, onAboutClick);
		}
		
		private function onAboutClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if((buttonClicked as Button) == backBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			}
		}
	}
}