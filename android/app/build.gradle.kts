import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
} else {
    throw GradleException("El archivo key.properties no fue encontrado en: ${keystorePropertiesFile.absolutePath}")
}

android {
    namespace = "pe.gob.iiap.plantasmedicinal"
    compileSdk = 35

    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "pe.gob.iiap.plantasmedicinal"
        minSdk = 23
        targetSdk = 35
        versionCode = 2
        versionName = "1.0.1"

        ndk {
            abiFilters.addAll(listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64"))
        }
    }

    signingConfigs {
        create("release") {
            val keyAliasValue = keystoreProperties.getProperty("keyAlias")
            val keyPasswordValue = keystoreProperties.getProperty("keyPassword")
            val storeFilePath = keystoreProperties.getProperty("storeFile")
            val storePasswordValue = keystoreProperties.getProperty("storePassword")

            if (storeFilePath.isNullOrBlank()) {
                throw GradleException("Falta la propiedad storeFile en key.properties")
            }

            val storeFileObject = rootProject.file(storeFilePath)
            if (!storeFileObject.exists()) {
                throw GradleException("El archivo .jks no existe en la ruta: $storeFilePath")
            }

            keyAlias = keyAliasValue ?: throw GradleException("Falta keyAlias en key.properties")
            keyPassword = keyPasswordValue ?: throw GradleException("Falta keyPassword en key.properties")
            storeFile = storeFileObject
            storePassword = storePasswordValue ?: throw GradleException("Falta storePassword en key.properties")
        }
    }

    buildTypes {
        getByName("release") {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = signingConfigs.getByName("release")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.15.0"))
    implementation("com.google.firebase:firebase-dynamic-links")
}