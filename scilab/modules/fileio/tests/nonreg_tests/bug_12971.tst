// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

// <-- Non-regression test for bug 12971 -->
//
// <-- Bugzilla URL -->
// http://bugzilla.scilab.org/show_bug.cgi?id=12971
//
// <-- Short Description -->
// getURL() downloaded file name is wrong

function checkFile(filename, expectedFileName, minimalFileSize)
    assert_checkequal(filename, expectedFileName)
    info = fileinfo(filename);
    assert_checktrue(info(1) > minimalFileSize);
    deletefile(filename);
endfunction

curdir = pwd();
cd(TMPDIR);

filename = getURL("www.scilab.org");

expectedFileName = "index.html";
assert_checkequal(filename, expectedFileName);
assert_checktrue(isfile(expectedFileName));

deletefile(expectedFileName);
cd(curdir);