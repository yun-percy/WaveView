.class public Lcom/android/systemui/recent/FastBlur;
.super Ljava/lang/Object;
.source "FastBlur.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doBlur(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;
    .locals 42
    .param p0, "sentBitmap"    # Landroid/graphics/Bitmap;
    .param p1, "radius"    # I
    .param p2, "canReuseInBitmap"    # Z

    .prologue
    .line 14
    if-eqz p2, :cond_0

    .line 15
    move-object/from16 v2, p0

    .line 20
    .local v2, "bitmap":Landroid/graphics/Bitmap;
    :goto_0
    const/4 v4, 0x1

    move/from16 v0, p1

    if-ge v0, v4, :cond_1

    .line 21
    const/4 v2, 0x0

    .line 214
    .end local v2    # "bitmap":Landroid/graphics/Bitmap;
    :goto_1
    return-object v2

    .line 17
    :cond_0
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    const/4 v6, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v6}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v2

    .restart local v2    # "bitmap":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    .line 25
    .local v5, "w":I
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 27
    .local v9, "h":I
    mul-int v4, v5, v9

    new-array v3, v4, [I

    .line 28
    .local v3, "pix":[I
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v8, v5

    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 30
    add-int/lit8 v36, v5, -0x1

    .line 31
    .local v36, "wm":I
    add-int/lit8 v21, v9, -0x1

    .line 32
    .local v21, "hm":I
    mul-int v35, v5, v9

    .line 33
    .local v35, "wh":I
    add-int v4, p1, p1

    add-int/lit8 v14, v4, 0x1

    .line 35
    .local v14, "div":I
    move/from16 v0, v35

    new-array v0, v0, [I

    move-object/from16 v24, v0

    .line 36
    .local v24, "r":[I
    move/from16 v0, v35

    new-array v0, v0, [I

    move-object/from16 v17, v0

    .line 37
    .local v17, "g":[I
    move/from16 v0, v35

    new-array v10, v0, [I

    .line 39
    .local v10, "b":[I
    invoke-static {v5, v9}, Ljava/lang/Math;->max(II)I

    move-result v4

    new-array v0, v4, [I

    move-object/from16 v34, v0

    .line 41
    .local v34, "vmin":[I
    add-int/lit8 v4, v14, 0x1

    shr-int/lit8 v15, v4, 0x1

    .line 42
    .local v15, "divsum":I
    mul-int/2addr v15, v15

    .line 43
    mul-int/lit16 v4, v15, 0x100

    new-array v0, v4, [I

    move-object/from16 v16, v0

    .line 44
    .local v16, "dv":[I
    const/16 v22, 0x0

    .local v22, "i":I
    :goto_2
    mul-int/lit16 v4, v15, 0x100

    move/from16 v0, v22

    if-lt v0, v4, :cond_2

    .line 48
    const/16 v39, 0x0

    .local v39, "yi":I
    move/from16 v41, v39

    .line 50
    .local v41, "yw":I
    const/4 v4, 0x3

    filled-new-array {v14, v4}, [I

    move-result-object v4

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, [[I

    .line 55
    .local v31, "stack":[[I
    add-int/lit8 v25, p1, 0x1

    .line 59
    .local v25, "r1":I
    const/16 v38, 0x0

    .local v38, "y":I
    :goto_3
    move/from16 v0, v38

    if-lt v0, v9, :cond_3

    .line 132
    const/16 v37, 0x0

    .local v37, "x":I
    :goto_4
    move/from16 v0, v37

    if-lt v0, v5, :cond_8

    .line 213
    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v8, v5

    invoke-virtual/range {v2 .. v9}, Landroid/graphics/Bitmap;->setPixels([IIIIIII)V

    goto :goto_1

    .line 45
    .end local v25    # "r1":I
    .end local v31    # "stack":[[I
    .end local v37    # "x":I
    .end local v38    # "y":I
    .end local v39    # "yi":I
    .end local v41    # "yw":I
    :cond_2
    div-int v4, v22, v15

    aput v4, v16, v22

    .line 44
    add-int/lit8 v22, v22, 0x1

    goto :goto_2

    .line 60
    .restart local v25    # "r1":I
    .restart local v31    # "stack":[[I
    .restart local v38    # "y":I
    .restart local v39    # "yi":I
    .restart local v41    # "yw":I
    :cond_3
    const/4 v13, 0x0

    .local v13, "bsum":I
    move/from16 v20, v13

    .local v20, "gsum":I
    move/from16 v29, v13

    .local v29, "rsum":I
    move v12, v13

    .local v12, "boutsum":I
    move/from16 v19, v13

    .local v19, "goutsum":I
    move/from16 v28, v13

    .local v28, "routsum":I
    move v11, v13

    .local v11, "binsum":I
    move/from16 v18, v13

    .local v18, "ginsum":I
    move/from16 v27, v13

    .line 61
    .local v27, "rinsum":I
    move/from16 v0, p1

    neg-int v0, v0

    move/from16 v22, v0

    :goto_5
    move/from16 v0, v22

    move/from16 v1, p1

    if-le v0, v1, :cond_4

    .line 81
    move/from16 v32, p1

    .line 83
    .local v32, "stackpointer":I
    const/16 v37, 0x0

    .restart local v37    # "x":I
    :goto_6
    move/from16 v0, v37

    if-lt v0, v5, :cond_6

    .line 130
    add-int v41, v41, v5

    .line 59
    add-int/lit8 v38, v38, 0x1

    goto :goto_3

    .line 62
    .end local v32    # "stackpointer":I
    .end local v37    # "x":I
    :cond_4
    const/4 v4, 0x0

    move/from16 v0, v22

    invoke-static {v0, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    move/from16 v0, v36

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    add-int v4, v4, v39

    aget v23, v3, v4

    .line 63
    .local v23, "p":I
    add-int v4, v22, p1

    aget-object v30, v31, v4

    .line 64
    .local v30, "sir":[I
    const/4 v4, 0x0

    const/high16 v6, 0xff0000

    and-int v6, v6, v23

    shr-int/lit8 v6, v6, 0x10

    aput v6, v30, v4

    .line 65
    const/4 v4, 0x1

    const v6, 0xff00

    and-int v6, v6, v23

    shr-int/lit8 v6, v6, 0x8

    aput v6, v30, v4

    .line 66
    const/4 v4, 0x2

    move/from16 v0, v23

    and-int/lit16 v6, v0, 0xff

    aput v6, v30, v4

    .line 67
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v26, v25, v4

    .line 68
    .local v26, "rbs":I
    const/4 v4, 0x0

    aget v4, v30, v4

    mul-int v4, v4, v26

    add-int v29, v29, v4

    .line 69
    const/4 v4, 0x1

    aget v4, v30, v4

    mul-int v4, v4, v26

    add-int v20, v20, v4

    .line 70
    const/4 v4, 0x2

    aget v4, v30, v4

    mul-int v4, v4, v26

    add-int/2addr v13, v4

    .line 71
    if-lez v22, :cond_5

    .line 72
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v27, v27, v4

    .line 73
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v18, v18, v4

    .line 74
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v11, v4

    .line 61
    :goto_7
    add-int/lit8 v22, v22, 0x1

    goto :goto_5

    .line 76
    :cond_5
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v28, v28, v4

    .line 77
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v19, v19, v4

    .line 78
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v12, v4

    goto :goto_7

    .line 85
    .end local v23    # "p":I
    .end local v26    # "rbs":I
    .end local v30    # "sir":[I
    .restart local v32    # "stackpointer":I
    .restart local v37    # "x":I
    :cond_6
    aget v4, v16, v29

    aput v4, v24, v39

    .line 86
    aget v4, v16, v20

    aput v4, v17, v39

    .line 87
    aget v4, v16, v13

    aput v4, v10, v39

    .line 89
    sub-int v29, v29, v28

    .line 90
    sub-int v20, v20, v19

    .line 91
    sub-int/2addr v13, v12

    .line 93
    sub-int v4, v32, p1

    add-int v33, v4, v14

    .line 94
    .local v33, "stackstart":I
    rem-int v4, v33, v14

    aget-object v30, v31, v4

    .line 96
    .restart local v30    # "sir":[I
    const/4 v4, 0x0

    aget v4, v30, v4

    sub-int v28, v28, v4

    .line 97
    const/4 v4, 0x1

    aget v4, v30, v4

    sub-int v19, v19, v4

    .line 98
    const/4 v4, 0x2

    aget v4, v30, v4

    sub-int/2addr v12, v4

    .line 100
    if-nez v38, :cond_7

    .line 101
    add-int v4, v37, p1

    add-int/lit8 v4, v4, 0x1

    move/from16 v0, v36

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    aput v4, v34, v37

    .line 103
    :cond_7
    aget v4, v34, v37

    add-int v4, v4, v41

    aget v23, v3, v4

    .line 105
    .restart local v23    # "p":I
    const/4 v4, 0x0

    const/high16 v6, 0xff0000

    and-int v6, v6, v23

    shr-int/lit8 v6, v6, 0x10

    aput v6, v30, v4

    .line 106
    const/4 v4, 0x1

    const v6, 0xff00

    and-int v6, v6, v23

    shr-int/lit8 v6, v6, 0x8

    aput v6, v30, v4

    .line 107
    const/4 v4, 0x2

    move/from16 v0, v23

    and-int/lit16 v6, v0, 0xff

    aput v6, v30, v4

    .line 109
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v27, v27, v4

    .line 110
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v18, v18, v4

    .line 111
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v11, v4

    .line 113
    add-int v29, v29, v27

    .line 114
    add-int v20, v20, v18

    .line 115
    add-int/2addr v13, v11

    .line 117
    add-int/lit8 v4, v32, 0x1

    rem-int v32, v4, v14

    .line 118
    rem-int v4, v32, v14

    aget-object v30, v31, v4

    .line 120
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v28, v28, v4

    .line 121
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v19, v19, v4

    .line 122
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v12, v4

    .line 124
    const/4 v4, 0x0

    aget v4, v30, v4

    sub-int v27, v27, v4

    .line 125
    const/4 v4, 0x1

    aget v4, v30, v4

    sub-int v18, v18, v4

    .line 126
    const/4 v4, 0x2

    aget v4, v30, v4

    sub-int/2addr v11, v4

    .line 128
    add-int/lit8 v39, v39, 0x1

    .line 83
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_6

    .line 133
    .end local v11    # "binsum":I
    .end local v12    # "boutsum":I
    .end local v13    # "bsum":I
    .end local v18    # "ginsum":I
    .end local v19    # "goutsum":I
    .end local v20    # "gsum":I
    .end local v23    # "p":I
    .end local v27    # "rinsum":I
    .end local v28    # "routsum":I
    .end local v29    # "rsum":I
    .end local v30    # "sir":[I
    .end local v32    # "stackpointer":I
    .end local v33    # "stackstart":I
    :cond_8
    const/4 v13, 0x0

    .restart local v13    # "bsum":I
    move/from16 v20, v13

    .restart local v20    # "gsum":I
    move/from16 v29, v13

    .restart local v29    # "rsum":I
    move v12, v13

    .restart local v12    # "boutsum":I
    move/from16 v19, v13

    .restart local v19    # "goutsum":I
    move/from16 v28, v13

    .restart local v28    # "routsum":I
    move v11, v13

    .restart local v11    # "binsum":I
    move/from16 v18, v13

    .restart local v18    # "ginsum":I
    move/from16 v27, v13

    .line 134
    .restart local v27    # "rinsum":I
    move/from16 v0, p1

    neg-int v4, v0

    mul-int v40, v4, v5

    .line 135
    .local v40, "yp":I
    move/from16 v0, p1

    neg-int v0, v0

    move/from16 v22, v0

    :goto_8
    move/from16 v0, v22

    move/from16 v1, p1

    if-le v0, v1, :cond_9

    .line 164
    move/from16 v39, v37

    .line 165
    move/from16 v32, p1

    .line 166
    .restart local v32    # "stackpointer":I
    const/16 v38, 0x0

    :goto_9
    move/from16 v0, v38

    if-lt v0, v9, :cond_c

    .line 132
    add-int/lit8 v37, v37, 0x1

    goto/16 :goto_4

    .line 136
    .end local v32    # "stackpointer":I
    :cond_9
    const/4 v4, 0x0

    move/from16 v0, v40

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int v39, v4, v37

    .line 138
    add-int v4, v22, p1

    aget-object v30, v31, v4

    .line 140
    .restart local v30    # "sir":[I
    const/4 v4, 0x0

    aget v6, v24, v39

    aput v6, v30, v4

    .line 141
    const/4 v4, 0x1

    aget v6, v17, v39

    aput v6, v30, v4

    .line 142
    const/4 v4, 0x2

    aget v6, v10, v39

    aput v6, v30, v4

    .line 144
    invoke-static/range {v22 .. v22}, Ljava/lang/Math;->abs(I)I

    move-result v4

    sub-int v26, v25, v4

    .line 146
    .restart local v26    # "rbs":I
    aget v4, v24, v39

    mul-int v4, v4, v26

    add-int v29, v29, v4

    .line 147
    aget v4, v17, v39

    mul-int v4, v4, v26

    add-int v20, v20, v4

    .line 148
    aget v4, v10, v39

    mul-int v4, v4, v26

    add-int/2addr v13, v4

    .line 150
    if-lez v22, :cond_b

    .line 151
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v27, v27, v4

    .line 152
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v18, v18, v4

    .line 153
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v11, v4

    .line 160
    :goto_a
    move/from16 v0, v22

    move/from16 v1, v21

    if-ge v0, v1, :cond_a

    .line 161
    add-int v40, v40, v5

    .line 135
    :cond_a
    add-int/lit8 v22, v22, 0x1

    goto :goto_8

    .line 155
    :cond_b
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v28, v28, v4

    .line 156
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v19, v19, v4

    .line 157
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v12, v4

    goto :goto_a

    .line 168
    .end local v26    # "rbs":I
    .end local v30    # "sir":[I
    .restart local v32    # "stackpointer":I
    :cond_c
    const/high16 v4, -0x1000000

    aget v6, v3, v39

    and-int/2addr v4, v6

    aget v6, v16, v29

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v4, v6

    aget v6, v16, v20

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v4, v6

    aget v6, v16, v13

    or-int/2addr v4, v6

    aput v4, v3, v39

    .line 170
    sub-int v29, v29, v28

    .line 171
    sub-int v20, v20, v19

    .line 172
    sub-int/2addr v13, v12

    .line 174
    sub-int v4, v32, p1

    add-int v33, v4, v14

    .line 175
    .restart local v33    # "stackstart":I
    rem-int v4, v33, v14

    aget-object v30, v31, v4

    .line 177
    .restart local v30    # "sir":[I
    const/4 v4, 0x0

    aget v4, v30, v4

    sub-int v28, v28, v4

    .line 178
    const/4 v4, 0x1

    aget v4, v30, v4

    sub-int v19, v19, v4

    .line 179
    const/4 v4, 0x2

    aget v4, v30, v4

    sub-int/2addr v12, v4

    .line 181
    if-nez v37, :cond_d

    .line 182
    add-int v4, v38, v25

    move/from16 v0, v21

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v4

    mul-int/2addr v4, v5

    aput v4, v34, v38

    .line 184
    :cond_d
    aget v4, v34, v38

    add-int v23, v37, v4

    .line 186
    .restart local v23    # "p":I
    const/4 v4, 0x0

    aget v6, v24, v23

    aput v6, v30, v4

    .line 187
    const/4 v4, 0x1

    aget v6, v17, v23

    aput v6, v30, v4

    .line 188
    const/4 v4, 0x2

    aget v6, v10, v23

    aput v6, v30, v4

    .line 190
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v27, v27, v4

    .line 191
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v18, v18, v4

    .line 192
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v11, v4

    .line 194
    add-int v29, v29, v27

    .line 195
    add-int v20, v20, v18

    .line 196
    add-int/2addr v13, v11

    .line 198
    add-int/lit8 v4, v32, 0x1

    rem-int v32, v4, v14

    .line 199
    aget-object v30, v31, v32

    .line 201
    const/4 v4, 0x0

    aget v4, v30, v4

    add-int v28, v28, v4

    .line 202
    const/4 v4, 0x1

    aget v4, v30, v4

    add-int v19, v19, v4

    .line 203
    const/4 v4, 0x2

    aget v4, v30, v4

    add-int/2addr v12, v4

    .line 205
    const/4 v4, 0x0

    aget v4, v30, v4

    sub-int v27, v27, v4

    .line 206
    const/4 v4, 0x1

    aget v4, v30, v4

    sub-int v18, v18, v4

    .line 207
    const/4 v4, 0x2

    aget v4, v30, v4

    sub-int/2addr v11, v4

    .line 209
    add-int v39, v39, v5

    .line 166
    add-int/lit8 v38, v38, 0x1

    goto/16 :goto_9
.end method
