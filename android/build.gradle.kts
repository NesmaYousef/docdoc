allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
flavorDimensions += "default"
productFlavors {
    create("development") {
        dimension = "default"
        applicationIdSuffix = ".development"
    }
    create("production") {
        dimension = "default"
        applicationIdSuffix = ".production"
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
