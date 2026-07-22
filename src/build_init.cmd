@setlocal
@pushd %~dp0

@set _L=%~dp0..\build\logs

md ..\build\artifacts
md ..\build\logs\crashdumps
md ..\build\logs\TestResults

msbuild -Restore internal\SetBuildNumber\SomeVerInit.verproj -nologo -p:SomeVerMinimumMajorMinor=8.0

echo ":: LIST TARGETS"
msbuild internal\SetBuildNumber\SomeVerInit.verproj -targets

echo ":: BEFORE msbuild SomeVerInit.verproj"
msbuild internal\SetBuildNumber\SomeVerInit.verproj -target:SomeVerApplyVersionTemplates -bl:%_L%\somever_init.binlog
echo ":: END msbuild SomeVerInit.verproj"
:: msbuild -Restore internal\SetBuildNumber\SomeVerInit.verproj -nologo

echo "D:\a\wix-fork\wix-fork\build\SomeVerInfo.cs"
type  D:\a\wix-fork\wix-fork\build\SomeVerInfo.cs
exit 1



@popd
@endlocal
