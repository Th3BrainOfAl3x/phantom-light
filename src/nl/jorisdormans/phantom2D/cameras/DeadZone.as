package nl.jorisdormans.phantom2D.cameras 
{
	/**
	 * DeadZone camera components: The camera ignores when its target 
	 * changes within the deadzone (a rectange centered in the middle 
	 * of the screen). DeadZone is best combined with a CameraEase
	 * component.
	 * @author Joris Dormans
	 */
	public class DeadZone extends CameraComponent
	{
		private var width:Number
		private var height:Number
		
		public function DeadZone(width:Number, height:Number) 
		{
			this.width = width * 0.5;
			this.height = height * 0.5;
		}
		
		override public function update(elapsedTime:Number):void 
		{
			super.update(elapsedTime);
			if (camera.target.x - camera.position.x >= width) {
				camera.target.x -= width;
			} else if (camera.target.x - camera.position.x <= -width) {
				camera.target.x += width;
			} else {
				camera.target.x = camera.position.x;
			}
			
			if (camera.target.y - camera.position.y >= height) {
				camera.target.y -= height;
			} else if (camera.target.y - camera.position.y <= -height) {
				camera.target.y += height;
			} else {
				camera.target.y = camera.position.y;
			}
			
		}
	}

}