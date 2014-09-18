package com.android.systemui.recent;

import android.app.Activity;
import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.Display;
import android.view.View;
import android.widget.FrameLayout;

public class RecentsActivity extends Activity {

	FrameLayout  yun_bg;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
       wallpaper();
//       WaterWaveView startwave =new WaterWaveView(startwave);
//       start=WaterWaveView.startWave()
//       start=new WaterWaveView(RecentsActivity.this);
//       start.startWave();
	
	}

	private void wallpaper(){
		WallpaperManager wallpaperManager = WallpaperManager.getInstance(this);
		Drawable wallpaperDrawable = wallpaperManager.getDrawable();
		Bitmap bm = ((BitmapDrawable) wallpaperDrawable).getBitmap();
		yun_bg= (FrameLayout) this.findViewById(R.id.yun_bg);
		blur(bm,yun_bg);
	}
	private void blur(Bitmap bkg, View view) { 
		   float scaleFactor = 1; 
		        scaleFactor = 18; 
		   float  radius =4; 
		        Display mDisplay = getWindowManager().getDefaultDisplay();
		        int w = mDisplay.getWidth();
		        int h =mDisplay.getHeight();
		   Bitmap overlay = Bitmap.createBitmap((int) (w/scaleFactor), 
		           (int) (h/scaleFactor), Bitmap.Config.ARGB_8888); 
		   Canvas canvas = new Canvas(overlay); 
		   canvas.translate(-view.getLeft()/scaleFactor, -view.getTop()/scaleFactor); 
		   canvas.scale(1 / scaleFactor, 1 / scaleFactor); 
		   Paint paint = new Paint(); 
		   paint.setFlags(Paint.FILTER_BITMAP_FLAG); 
		   canvas.drawBitmap(bkg, 0, 0, paint); 
		   overlay = FastBlur.doBlur(overlay, (int)radius, true); 
		   view.setBackgroundDrawable(new BitmapDrawable(getResources(), overlay)); 
		} 

}
