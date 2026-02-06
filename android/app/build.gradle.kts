plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    // keep only if you use Firebase:
    // id("com.google.gms.google-services")
}

android {
    namespace = "com.example.expenses_tracker"
    compileSdk = 36 // (or your number; use flutter.compileSdkVersion if you want)

    defaultConfig {
        applicationId = "com.example.expenses_tracker"
        minSdk = flutter.minSdkVersion
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        // ✅ this is the correct Kotlin DSL for AGP 8.x
        isCoreLibraryDesugaringEnabled = true

        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
