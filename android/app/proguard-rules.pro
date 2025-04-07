# الحفاظ على الكود الأساسي
-keep class com.yourpackage.** { *; }

# الحفاظ على الأنشطة والـ Fragments
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Fragment
-keep public class * extends androidx.fragment.app.Fragment

# مكتبات Gson و Retrofit
-keep class com.google.gson.** { *; }
-keep class retrofit2.** { *; }
-keep interface retrofit2.** { *; }

# مكتبة Glide
-keep class com.bumptech.glide.** { *; }
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ResourceDecoder { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Room
-keep class androidx.room.** { *; }
-keep @androidx.room.Dao public class * { *; }

# الحفاظ على التعليقات
-keepattributes *Annotation*

# الحفاظ على الأكواد عند الإطلاق
-keep public class * implements android.app.Application { *; }
