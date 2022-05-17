package zoo
{
	import flash.utils.setInterval
	import flash.utils.clearInterval;
	
	internal class VirtualPet {
		private static var maxNameLength = 20;
		private static var maxCalories = 2000;
		private var petName;
		
		private var currentCalories = VirtualPet.maxCalories / 2;
		
		public function VirtualPet (name) {
			setName(name);
			
			digestIntervalID = setInterval(digest, 1000);
			
		}
		
		
		public function eat (numberOfCalories) {
		
			if (currentCalories == 0) {
				trace(getName() + "은/는 죽었습니다. 음식을 먹일 수 없습니다.");
				 return;
			}
			
			var newCurrentCalories = currentCalories + numberOfCalories;
			if (newCurrentCalories > VirtualPet.maxCalories) {
				currentCalories = VirtualPet.maxCalories;
			} else {
				currentCalories = newCurrentCalories;
			}
			
			
			trace(getName() + "이/가 음식을 먹었습니다. 이제 남은 칼로리는 " + currentCalories + "입니다.");
		}
		
		public function getHunger () {
			return currentCalories / VirtualPet.maxCalories;
		}
		
		
		public function setName (newName) {
			if (newName.length > VirtualPet.maxNameLength) {
				newName = newName.substr(0, VirtualPet.maxNameLength);
				
			} else if ( newName == "") {
				return;
			}
			
			petName = newName;
		}
		
		public function getName () {
			return petName;
		}
		
		private function digest () {
			if (currentCalories - VirtualPet.caloriesPerSecond <= 0) {
				clearInterval(digestIntervalID);
				currentCalories = 0;
				trace(getName() + "이/가 죽었습니다.");
				
			} else {
				currentCalories -= VirtualPet.caloriesPerSecond;
				trace(getName() +"이/가 음식을 소화했습니다. 이제 남은 칼로리는" + currentCalories + "입니다");
			}
		
			
		}
	}

}
