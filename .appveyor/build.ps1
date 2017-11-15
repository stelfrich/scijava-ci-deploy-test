If (($Env:APPVEYOR_REPO_BRANCH -match "master") -and !(Test-Path Env:\APPVEYOR_PULL_REQUEST_NUMBER)) {
    # Build and deploy SNAPSHOT
    "== Building and deploying master SNAPSHOT =="
    & "mvn" "-B" "-Pdeploy-to-imagej,sign" "deploy" 2> $null
} Else {
    If (($Env:APPVEYOR_REPO_TAG -match "true") -and (Test-Path ($Env:APPVEYOR_BUILD_FOLDER + "\release.properties"))) {
        # Cut and deploy release
        "== Cutting and deploying release version =="
        & "mvn" "-B" "release:perform" 2> $null
    } Else {
        # Build locally
        "== Building the artifact locally only =="
        & "mvn" "-B" "install" 2> $null
    }
}

exit $LASTEXITCODE
