import os
import sys
import subprocess
import openmmtorch

if sys.platform == "win32":
    # Needed for the test exe files to find the OpenMMTorch.dll file
    libpath = os.path.join(os.environ["CONDA_PREFIX"], "Library", "lib")
    _path = os.environ["PATH"]
    os.environ["PATH"] = f"{libpath};{libpath}\plugins;{_path}"
    os.add_dll_directory(libpath)

# Change to the tests directory
test_dir = os.path.join(os.environ["CONDA_PREFIX"], "share", "openmm-torch", "tests")

# List directory contents
files = os.listdir(test_dir)
print(files)

summary = ""
exitcode = 0

# Iterate through test files
for ff in files:
    if ff.startswith("Test"):
        # Skip CUDA and OpenCL tests
        if "Cuda" in ff or "OpenCL" in ff:
            continue

        print(f"Running {ff}...")

        # Run the test and capture return code
        exitc = subprocess.run(
            os.path.join(test_dir, ff), env=os.environ, cwd=test_dir
        ).returncode

        # Build summary string
        summary += f"\n{ff}: {'OK' if exitc == 0 else 'FAILED'}"
        exitcode += exitc

# Print summary
print(f"-------\nSummary\n-------{summary}\n")

sys.exit(exitcode)
