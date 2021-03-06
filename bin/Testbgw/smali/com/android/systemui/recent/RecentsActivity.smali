.class public Lcom/android/systemui/recent/RecentsActivity;
.super Landroid/app/Activity;
.source "RecentsActivity.java"


# instance fields
.field yun_bg:Landroid/widget/FrameLayout;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private blur(Landroid/graphics/Bitmap;Landroid/view/View;)V
    .locals 13
    .param p1, "bkg"    # Landroid/graphics/Bitmap;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    const/high16 v12, 0x3f800000

    const/4 v11, 0x0

    .line 35
    const/high16 v6, 0x3f800000

    .line 36
    .local v6, "scaleFactor":F
    const/high16 v6, 0x41900000

    .line 37
    const/high16 v5, 0x40800000

    .line 38
    .local v5, "radius":F
    invoke-virtual {p0}, Lcom/android/systemui/recent/RecentsActivity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v8

    invoke-interface {v8}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 39
    .local v2, "mDisplay":Landroid/view/Display;
    invoke-virtual {v2}, Landroid/view/Display;->getWidth()I

    move-result v7

    .line 40
    .local v7, "w":I
    invoke-virtual {v2}, Landroid/view/Display;->getHeight()I

    move-result v1

    .line 41
    .local v1, "h":I
    int-to-float v8, v7

    div-float/2addr v8, v6

    float-to-int v8, v8

    .line 42
    int-to-float v9, v1

    div-float/2addr v9, v6

    float-to-int v9, v9

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 41
    invoke-static {v8, v9, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 43
    .local v3, "overlay":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 44
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v8

    neg-int v8, v8

    int-to-float v8, v8

    div-float/2addr v8, v6

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v9

    neg-int v9, v9

    int-to-float v9, v9

    div-float/2addr v9, v6

    invoke-virtual {v0, v8, v9}, Landroid/graphics/Canvas;->translate(FF)V

    .line 45
    div-float v8, v12, v6

    div-float v9, v12, v6

    invoke-virtual {v0, v8, v9}, Landroid/graphics/Canvas;->scale(FF)V

    .line 46
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    .line 47
    .local v4, "paint":Landroid/graphics/Paint;
    const/4 v8, 0x2

    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->setFlags(I)V

    .line 48
    invoke-virtual {v0, p1, v11, v11, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 49
    float-to-int v8, v5

    const/4 v9, 0x1

    invoke-static {v3, v8, v9}, Lcom/android/systemui/recent/FastBlur;->doBlur(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 50
    new-instance v8, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p0}, Lcom/android/systemui/recent/RecentsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p2, v8}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    return-void
.end method

.method private wallpaper()V
    .locals 4

    .prologue
    .line 28
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v2

    .line 29
    .local v2, "wallpaperManager":Landroid/app/WallpaperManager;
    invoke-virtual {v2}, Landroid/app/WallpaperManager;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 30
    .local v1, "wallpaperDrawable":Landroid/graphics/drawable/Drawable;
    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    .end local v1    # "wallpaperDrawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 31
    .local v0, "bm":Landroid/graphics/Bitmap;
    const/high16 v3, 0x7f080000

    invoke-virtual {p0, v3}, Lcom/android/systemui/recent/RecentsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    iput-object v3, p0, Lcom/android/systemui/recent/RecentsActivity;->yun_bg:Landroid/widget/FrameLayout;

    .line 32
    iget-object v3, p0, Lcom/android/systemui/recent/RecentsActivity;->yun_bg:Landroid/widget/FrameLayout;

    invoke-direct {p0, v0, v3}, Lcom/android/systemui/recent/RecentsActivity;->blur(Landroid/graphics/Bitmap;Landroid/view/View;)V

    .line 33
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/android/systemui/recent/RecentsActivity;->setContentView(I)V

    .line 23
    invoke-direct {p0}, Lcom/android/systemui/recent/RecentsActivity;->wallpaper()V

    .line 25
    return-void
.end method
